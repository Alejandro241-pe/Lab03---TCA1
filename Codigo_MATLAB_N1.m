clc;
clear;
close all;

%% =====================================
% ITEM 1 - BODE Y MARGENES (k = 1)
%% =====================================

s = tf('s');
k = 1;

%% =====================================
% a) G(s) = (s+1)/s^3
%% =====================================

L = (k*(s+1))/(s^3);

figure;
margin(L);
grid on;
title('a) G(s) = (s+1)/s^3');

[Gm,Pm,Wcg,Wcp] = margin(L);

fprintf('\n========== a) ==========\n');
fprintf('Margen de Fase: %.2f grados\n',Pm);
fprintf('Frecuencia de cruce de ganancia: %.4f rad/s\n',Wcp);

if isinf(Gm)
    fprintf('Margen de Ganancia: Infinito\n');
else
    fprintf('Margen de Ganancia: %.2f dB\n',20*log10(Gm));
    fprintf('Frecuencia de cruce de fase: %.4f rad/s\n',Wcg);
end

%% =====================================
% b) G(s) = (s+1)/[s(s+2)(s^2+s+1)]
%% =====================================

L = (k*(s+1))/(s*(s+2)*(s^2+s+1));

figure;
margin(L);
grid on;
title('b) G(s) = (s+1)/[s(s+2)(s^2+s+1)]');

[Gm,Pm,Wcg,Wcp] = margin(L);

fprintf('\n========== b) ==========\n');
fprintf('Margen de Fase: %.2f grados\n',Pm);
fprintf('Frecuencia de cruce de ganancia: %.4f rad/s\n',Wcp);

if isinf(Gm)
    fprintf('Margen de Ganancia: Infinito\n');
else
    fprintf('Margen de Ganancia: %.2f dB\n',20*log10(Gm));
    fprintf('Frecuencia de cruce de fase: %.4f rad/s\n',Wcg);
end

%% =====================================
% c) G(s) = (s+3)/[s(s+1)(s+2)]
%% =====================================

L = (k*(s+3))/(s*(s+1)*(s+2));

figure;
margin(L);
grid on;
title('c) G(s) = (s+3)/[s(s+1)(s+2)]');

%% =====================================
% d) G(s) = 1/[(s+2)(s-5)]
%% =====================================

L = k/((s+2)*(s-5));

figure;
margin(L);
grid on;
title('d) G(s) = 1/[(s+2)(s-5)]');

%% =====================================
% e) G(s) = (s+1)/[(s+5)(s^2-9)]
%% =====================================

L = (k*(s+1))/((s+5)*(s^2-9));

figure;
margin(L);
grid on;
title('e) G(s) = (s+1)/[(s+5)(s^2-9)]');

%% =====================================
% f) G(s) = (s+1)/[s(s-1)]
%% =====================================

L = (k*(s+1))/(s*(s-1));

figure;
margin(L);
grid on;
title('f) G(s) = (s+1)/[s(s-1)]');
