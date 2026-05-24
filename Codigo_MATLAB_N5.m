clc;
clear;
close all;

k = 1;

% Frecuencias
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

%% PROCEDIMIENTO 5

for i = 1:length(L)

    sistema = L{i};

    % Magnitud y fase
    mag = abs(sistema);

    phase = angle(sistema)*180/pi;

    %% =========================
    % DIAGRAMA DE NYQUIST
    % =========================

    figure;

    plot(real(sistema),imag(sistema),'LineWidth',2);

    hold on;

    % Parte conjugada
    plot(real(sistema),-imag(sistema),'LineWidth',2);

    % Punto crítico
    plot(-1,0,'ro','MarkerSize',10,'LineWidth',2);

    grid on;

    xlabel('Parte Real');

    ylabel('Parte Imaginaria');

    title(['Nyquist L',num2str(i)]);

    axis equal;

    %% =========================
    % MARGEN DE GANANCIA
    % =========================

    % Buscar donde fase ≈ -180°
    [~,idx_phase] = min(abs(phase + 180));

    GM = 1/mag(idx_phase);

    GM_dB = 20*log10(GM);

    %% =========================
    % MARGEN DE FASE
    % =========================

    % Buscar donde magnitud ≈ 1
    [~,idx_gain] = min(abs(mag - 1));

    PM = 180 + phase(idx_gain);

    %% =========================
    % GANANCIA CRITICA
    % =========================

    Kcrit = GM;

    %% =========================
    % RESULTADOS
    % =========================

    fprintf('\n=========================\n');

    fprintf('Sistema L%d\n',i);

    fprintf('=========================\n');

    fprintf('Margen de Ganancia = %.4f\n',GM);

    fprintf('Margen de Ganancia dB = %.4f dB\n',GM_dB);

    fprintf('Margen de Fase = %.4f grados\n',PM);

    fprintf('Ganancia Critica Kcrit = %.4f\n',Kcrit);

    %% =========================
    % ANALISIS DE ESTABILIDAD
    % =========================

    if PM > 0 && GM > 1

        fprintf('Sistema ESTABLE\n');

    else

        fprintf('Sistema INESTABLE o marginal\n');

    end

end
