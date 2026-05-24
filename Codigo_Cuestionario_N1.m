clc;
clear;
close all;

%% ==========================
% FUNCION DE TRANSFERENCIA
% ==========================

% Variable de Laplace
s = tf('s');

% Sistema Taipei 101
G = (0.8303)/(s^2 + 0.0803*s + 0.8303);

%% ==========================
% VECTOR DE FRECUENCIAS
% ==========================

w = logspace(-2,2,1000); % 0.01 a 100 rad/s

%% ==========================
% RESPUESTA EN FRECUENCIA
% ==========================

[mag, phase, wout] = bode(G,w);

% Convertir dimensiones
mag = squeeze(mag);
phase = squeeze(phase);

% Magnitud en dB
mag_dB = 20*log10(mag);

%% ==========================
% GRAFICA DE MAGNITUD
% ==========================

figure;
semilogx(wout, mag_dB, 'LineWidth',2);
grid on;
xlabel('\omega (rad/s)');
ylabel('Magnitud (dB)');
title('Diagrama de Bode - Magnitud');

%% ==========================
% GRAFICA DE FASE
% ==========================

figure;
semilogx(wout, phase, 'LineWidth',2);
grid on;
xlabel('\omega (rad/s)');
ylabel('Fase (grados)');
title('Diagrama de Bode - Fase');