clc;
clear;
close all;

%% ==========================
% FUNCION DE TRANSFERENCIA
% ==========================

% Variable de Laplace
s = tf('s');

% Sistema de vibracion de panel solar satelital
G = 0.0833/(s^2 + 1.5*s + 100);

%% ==========================
% VECTOR DE FRECUENCIAS
% ==========================

w = logspace(-1,3,1000); % 0.1 a 1000 rad/s

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