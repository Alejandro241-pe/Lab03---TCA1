clc;
clear;
close all;

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
fprintf('L(s) = (k*(s+1))/(s^3)\n');
fprintf('Margen de fase: %.2f°\n',Pm);

if isinf(Gm)
    fprintf('Margen de ganancia: Infinito\n');
else
    fprintf('Margen de ganancia: %.2f dB\n',20*log10(Gm));
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
fprintf('L(s) = (k*(s+1))/(s*(s+2)*(s^2+s+1))\n');
fprintf('Margen de fase: %.2f°\n',Pm);

if isinf(Gm)
    fprintf('Margen de ganancia: Infinito\n');
else
    fprintf('Margen de ganancia: %.2f dB\n',20*log10(Gm));
end

%% =====================================
% c) G(s) = (s+3)/[s(s+1)(s+2)]
%% =====================================

L = (k*(s+3))/(s*(s+1)*(s+2));

figure;
margin(L);
grid on;
title('c) G(s) = (s+3)/[s(s+1)(s+2)]');

[Gm,Pm,Wcg,Wcp] = margin(L);

fprintf('\n========== c) ==========\n');
fprintf('L(s) = (k*(s+3))/(s*(s+1)*(s+2))\n');
fprintf('Margen de fase: %.2f°\n',Pm);

if isinf(Gm)
    fprintf('Margen de ganancia: Infinito\n');
else
    fprintf('Margen de ganancia: %.2f dB\n',20*log10(Gm));
end

%% =====================================
% d) G(s) = 1/[(s+2)(s-5)]
%% =====================================

L = k/((s+2)*(s-5));

figure;
margin(L);
grid on;
title('d) G(s) = 1/[(s+2)(s-5)]');

[Gm,Pm,Wcg,Wcp] = margin(L);

fprintf('\n========== d) ==========\n');
fprintf('L(s) = k/((s+2)*(s-5))\n');
fprintf('Margen de fase: %.2f°\n',Pm);

if isinf(Gm)
    fprintf('Margen de ganancia: Infinito\n');
else
    fprintf('Margen de ganancia: %.2f dB\n',20*log10(Gm));
end

%% =====================================
% e) G(s) = (s+1)/[(s+5)(s^2-9)]
%% =====================================

L = (k*(s+1))/((s+5)*(s^2-9));

figure;
margin(L);
grid on;
title('e) G(s) = (s+1)/[(s+5)(s^2-9)]');

[Gm,Pm,Wcg,Wcp] = margin(L);

fprintf('\n========== e) ==========\n');
fprintf('L(s) = (k*(s+1))/((s+5)*(s^2-9))\n');
fprintf('Margen de fase: %.2f°\n',Pm);

if isinf(Gm)
    fprintf('Margen de ganancia: Infinito\n');
else
    fprintf('Margen de ganancia: %.2f dB\n',20*log10(Gm));
end

%% =====================================
% f) G(s) = (s+1)/[s(s-1)]
%% =====================================

L = (k*(s+1))/(s*(s-1));

figure;
margin(L);
grid on;
title('f) G(s) = (s+1)/[s(s-1)]');

[Gm,Pm,Wcg,Wcp] = margin(L);

fprintf('\n========== f) ==========\n');
fprintf('L(s) = (k*(s+1))/(s*(s-1))\n');
fprintf('Margen de fase: %.2f°\n',Pm);

if isinf(Gm)
    fprintf('Margen de ganancia: Infinito\n');
else
    fprintf('Margen de ganancia: %.2f dB\n',20*log10(Gm));
end
