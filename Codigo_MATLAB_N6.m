clc;
clear;
close all;

k = 1;

% Tiempo
t = linspace(0,20,2000);

% Frecuencias
w = logspace(-2,2,2000);

jw = 1j*w;

%% FUNCIONES L(s)

L1 = k*(jw+1)./(jw.^3);

L2 = k*(jw+1)./(jw.*(jw+2).*(jw.^2+jw+1));

L3 = k*(jw+3)./(jw.*(jw+1).*(jw+2));

L4 = k./((jw+2).*(jw-5));

L5 = k*(jw+1)./((jw+5).*(jw.^2-9));

L6 = k*(jw+1)./(jw.*(jw-1));

L = {L1,L2,L3,L4,L5,L6};

%% PROCEDIMIENTO 6

for i = 1:length(L)

    %% =========================
    % SISTEMA EN LAZO CERRADO
    % =========================

    T = L{i} ./ (1 + L{i});

    %% =========================
    % RESPUESTA AL ESCALON
    % =========================

    % Aproximación temporal
    y_step = real(ifft(T));

    y_step = y_step(1:length(t));

    %% =========================
    % RESPUESTA A RAMPA
    % =========================

    rampa = t;

    y_ramp = cumtrapz(t,y_step);

    %% =========================
    % GRAFICA ESCALON
    % =========================

    figure;

    plot(t,y_step,'LineWidth',2);

    grid on;

    title(['Respuesta al Escalon - L',num2str(i)]);

    xlabel('Tiempo');

    ylabel('Salida');

    %% =========================
    % GRAFICA RAMPA
    % =========================

    figure;

    plot(t,y_ramp,'LineWidth',2);

    grid on;

    title(['Respuesta a la Rampa - L',num2str(i)]);

    xlabel('Tiempo');

    ylabel('Salida');

    %% =========================
    % ESTABILIDAD
    % =========================

    fprintf('\n====================\n');

    fprintf('Sistema L%d\n',i);

    fprintf('====================\n');

    if max(abs(y_step)) < 100

        fprintf('Sistema estable\n');

    else

        fprintf('Sistema inestable\n');

    end

end
