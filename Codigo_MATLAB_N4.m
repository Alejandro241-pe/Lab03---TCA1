clc;
clear;
close all;

% Valor de k
k = 1;

% Vector de frecuencias
w = logspace(-2,2,1000);

% Variable compleja jw
jw = 1j*w;

%% =========================
% FUNCIONES DE TRANSFERENCIA
% ==========================

L1 = k*(jw+1)./(jw.^3);

L2 = k*(jw+1)./(jw.*(jw+2).*(jw.^2+jw+1));

L3 = k*(jw+3)./(jw.*(jw+1).*(jw+2));

L4 = k./((jw+2).*(jw-5));

L5 = k*(jw+1)./((jw+5).*(jw.^2-9));

L6 = k*(jw+1)./(jw.*(jw-1));

% Guardar en celda
L = {L1,L2,L3,L4,L5,L6};

%% =========================
% MAGNITUD Y FASE
% ==========================

for i = 1:length(L)

    % Magnitud
    mag = abs(L{i});

    % Magnitud en dB
    mag_dB = 20*log10(mag);

    % Fase
    phase = angle(L{i})*180/pi;

    %% Mostrar algunos valores

    fprintf('\n====================\n');
    fprintf('Sistema L%d\n',i);
    fprintf('====================\n');

    fprintf('Primeros 10 valores Magnitud dB:\n');
    disp(mag_dB(1:10));

    fprintf('Primeros 10 valores Fase:\n');
    disp(phase(1:10));

    %% GRAFICA MAGNITUD

    figure;
    semilogx(w,mag_dB,'LineWidth',2);
    grid on;
    title(['Magnitud L',num2str(i)]);
    xlabel('\omega (rad/s)');
    ylabel('Magnitud (dB)');

    %% GRAFICA FASE

    figure;
    semilogx(w,phase,'LineWidth',2);
    grid on;
    title(['Fase L',num2str(i)]);
    xlabel('\omega (rad/s)');
    ylabel('Fase (grados)');

end
