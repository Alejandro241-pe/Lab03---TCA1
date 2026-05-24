clc;
clear;
close all;

% Numerador
num = [10];

% Denominador
den = [1 2 10];

% Frecuencias
w = logspace(-1,2,1000);

jw = 1j*w;

%% Evaluacion de G(jw)

G = 10 ./ ((jw.^2) + 2*jw + 10);

%% Magnitud y fase

mag = abs(G);

mag_dB = 20*log10(mag);

phase = angle(G)*180/pi;

%% DIAGRAMA DE BODE

figure;

subplot(2,1,1)

semilogx(w,mag_dB,'LineWidth',2);

grid on;

title('Bode Magnitud - F16');

xlabel('\omega (rad/s)');

ylabel('Magnitud (dB)');

subplot(2,1,2)

semilogx(w,phase,'LineWidth',2);

grid on;

title('Bode Fase - F16');

xlabel('\omega (rad/s)');

ylabel('Fase (grados)');
