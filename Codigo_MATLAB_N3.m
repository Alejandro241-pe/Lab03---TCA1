clc;
clear;
close all;

%% Valores de k obtenidos anteriormente

k1 = 1000.00000;
k2 = 1.12578;
k3 = 0.67989;
k4 = 9.99540;
k5 = 31.26977;
k6 = 2.38544;

s = tf('s');

%% Funciones de transferencia

L1 = k1*(s+1)/(s^3);

L2 = k2*(s+1)/(s*(s+2)*(s^2+s+1));

L3 = k3*(s+3)/(s*(s+1)*(s+2));

L4 = k4/((s+2)*(s-5));

L5 = k5*(s+1)/((s+5)*(s^2-9));

L6 = k6*(s+1)/(s*(s-1));

Sistemas = {L1,L2,L3,L4,L5,L6};

%% Calculo de Kp, Kv, Ka y error estacionario para rampa

for i = 1:length(Sistemas)

    G = Sistemas{i};

    Kp = dcgain(G);
    Kv = dcgain(s*G);
    Ka = dcgain(s^2*G);

    % Error en estado estacionario para rampa unitaria
    if isinf(Kv)
        ess = 0;
    elseif abs(Kv) < 1e-6
        ess = inf;
    else
        ess = 1/Kv;
    end

    fprintf('\n====================================\n');
    fprintf('Sistema %d\n',i);
    fprintf('Kp = %.5f\n',Kp);
    fprintf('Kv = %.5f\n',Kv);
    fprintf('Ka = %.5f\n',Ka);

    if isinf(ess)
        fprintf('ess (rampa unitaria) = Infinito\n');
    else
        fprintf('ess (rampa unitaria) = %.5f\n',ess);
    end
end