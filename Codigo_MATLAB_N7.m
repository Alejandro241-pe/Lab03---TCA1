clc;
clear;
close all;

k = 1;

w = logspace(-2,2,1000);

jw = 1j*w;

%% FUNCIONES

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

    mag = abs(sistema);

    mag_dB = 20*log10(mag);

    phase = angle(sistema)*180/pi;

    %% =========================
    % MARGEN DE GANANCIA
    % =========================

    [~,idx_phase] = min(abs(phase + 180));

    GM = 1/mag(idx_phase);

    GM_dB = 20*log10(GM);

    %% =========================
    % MARGEN DE FASE
    % =========================

    [~,idx_gain] = min(abs(mag - 1));

    PM = 180 + phase(idx_gain);

    %% =========================
    % DIAGRAMA DE BLACK
    % =========================

    figure;

    plot(phase,mag_dB,'LineWidth',2);

    hold on;

    % Punto margen de ganancia
    plot(phase(idx_phase),mag_dB(idx_phase), ...
        'ro','MarkerSize',10,'LineWidth',2);

    % Punto margen de fase
    plot(phase(idx_gain),mag_dB(idx_gain), ...
        'go','MarkerSize',10,'LineWidth',2);

    % Linea 0 dB
    yline(0,'k--');

    % Linea -180 grados
    xline(-180,'k--');

    grid on;

    xlabel('Fase (grados)');

    ylabel('Magnitud (dB)');

    title(['Diagrama de Black - L',num2str(i)]);

    legend('Black','Margen de Ganancia', ...
           'Margen de Fase');

    %% RESULTADOS

    fprintf('\n=====================\n');

    fprintf('Sistema L%d\n',i);

    fprintf('=====================\n');

    fprintf('GM = %.4f\n',GM);

    fprintf('GM dB = %.4f dB\n',GM_dB);

    fprintf('PM = %.4f grados\n',PM);

end
