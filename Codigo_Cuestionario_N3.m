clc;
clear;
close all;

% Frecuencias
w = logspace(-1,2,1000);

jw = 1j*w;

%% Funcion de transferencia

G = 50 ./ ((jw.^2) + 15*jw + 50);

%% Magnitud y fase

mag = abs(G);

mag_dB = 20*log10(mag);

phase = angle(G)*180/pi;

%% =========================
% DIAGRAMA DE BODE
% =========================

figure;

subplot(2,1,1)

semilogx(w,mag_dB,'LineWidth',2);

grid on;

title('Bode Magnitud - Suspension MR');

xlabel('\omega (rad/s)');

ylabel('Magnitud (dB)');

subplot(2,1,2)

semilogx(w,phase,'LineWidth',2);

grid on;

title('Bode Fase - Suspension MR');

xlabel('\omega (rad/s)');

ylabel('Fase (grados)');
