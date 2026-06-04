clc;
clear;
close all;

k = 1;

% Vector de frecuencias
w = logspace(-2,2,1000);
jw = 1j*w;

%% FUNCIONES DE TRANSFERENCIA

L1 = k*(jw+1)./(jw.^3);

L2 = k*(jw+1)./(jw.*(jw+2).*(jw.^2+jw+1));

L3 = k*(jw+3)./(jw.*(jw+1).*(jw+2));

L4 = k./((jw+2).*(jw-5));

L5 = k*(jw+1)./((jw+5).*(jw.^2-9));

L6 = k*(jw+1)./(jw.*(jw-1));

L = {L1,L2,L3,L4,L5,L6};

%% PROCEDIMIENTO 7

for i = 1:length(L)

    sistema = L{i};

    %% MAGNITUD

    mag = abs(sistema);
    mag_dB = 20*log10(mag);

    %% FASE CORREGIDA

    phase = unwrap(angle(sistema))*180/pi;

    % Forzar representación negativa
    while max(phase) > 0
        phase = phase - 360;
    end

    %% =========================
    % MARGEN DE FASE
    % =========================

    idx_gain = find(diff(sign(mag_dB)),1);

    if ~isempty(idx_gain)

        PM = 180 + phase(idx_gain);

        phase_PM = phase(idx_gain);
        mag_PM = mag_dB(idx_gain);

    else

        PM = inf;

        phase_PM = NaN;
        mag_PM = NaN;

    end

    %% =========================
    % MARGEN DE GANANCIA
    % =========================

    idx_phase = find(diff(sign(phase + 180)),1);

    if ~isempty(idx_phase)

        GM = 1/mag(idx_phase);

        GM_dB = 20*log10(GM);

        phase_GM = phase(idx_phase);
        mag_GM = mag_dB(idx_phase);

    else

        GM = inf;
        GM_dB = inf;

        phase_GM = NaN;
        mag_GM = NaN;

    end

    %% =========================
    % DIAGRAMA DE BLACK
    % =========================

    figure;

    plot(phase,mag_dB,'b','LineWidth',2);

    hold on;

    % Punto margen de ganancia

    if ~isnan(phase_GM)

        plot(phase_GM,mag_GM,'ro','MarkerSize',10,'LineWidth',2);

    end

    % Punto margen de fase

    if ~isnan(phase_PM)

        plot(phase_PM,mag_PM,'go','MarkerSize',10,'LineWidth',2);

    end

    % Referencias

    yline(0,'k--','0 dB');

    xline(-180,'k--','-180°');

    grid on;

    xlabel('Fase (grados)');

    ylabel('Magnitud (dB)');

    title(['Diagrama de Black - L',num2str(i)]);

    legend('Black',...
           'Margen de Ganancia',...
           'Margen de Fase',...
           'Location','best');

    %% RESULTADOS

    fprintf('\n=====================\n');
    fprintf('Sistema L%d\n',i);
    fprintf('=====================\n');

    if isinf(GM)
        fprintf('GM = Infinito\n');
        fprintf('GM dB = Infinito\n');
    else
        fprintf('GM = %.4f\n',GM);
        fprintf('GM dB = %.4f dB\n',GM_dB);
    end

    if isinf(PM)
        fprintf('PM = Infinito\n');
    else
        fprintf('PM = %.4f grados\n',PM);
    end

end
