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

    % Trayectoria de frecuencias positivas
    plot(real(sistema),imag(sistema),'b','LineWidth',2);
    hold on;

    % Trayectoria de frecuencias negativas (Parte conjugada)
    plot(real(sistema),-imag(sistema),'r--','LineWidth',1.5);

    % Punto crítico (-1, 0) resaltado
    plot(-1,0,'ro','MarkerSize',10,'LineWidth',2);

    grid on;
    xlabel('Parte Real (Re)');
    ylabel('Parte Imaginaria (Im)');
    title(['Diagrama de Nyquist - Sistema L', num2str(i)]);
    axis equal;

    % Acotación dinámica de ejes para visualizar correctamente el punto (-1,0)
    % Evita que las asíntotas al infinito arruinen la escala del gráfico
    xlim([-2.5, 1.5]);
    ylim([-2, 2]);

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
    % IMPRESIÓN DE MARGENES EN CONSOLA
    % =========================
    fprintf('\n=========================\n');
    fprintf('Datos Numéricos L%d\n',i);
    fprintf('=========================\n');
    fprintf('Margen de Ganancia = %.4f\n',GM);
    fprintf('Margen de Ganancia dB = %.4f dB\n',GM_dB);
    fprintf('Margen de Fase = %.4f grados\n',PM);
    fprintf('Ganancia Critica Kcrit = %.4f\n',Kcrit);
end
