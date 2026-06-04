clc;
clear;
close all;

s = tf('s');
k = 1;

%% SISTEMAS

G{1} = (k*(s+1))/(s^3);

G{2} = (k*(s+1))/(s*(s+2)*(s^2+s+1));

G{3} = (k*(s+3))/(s*(s+1)*(s+2));

G{4} = k/((s+2)*(s-5));

G{5} = (k*(s+1))/((s+5)*(s^2-9));

G{6} = (k*(s+1))/(s*(s-1));

t = 0:0.01:20;

rampa = t;

for i = 1:length(G)

    fprintf('\n========================\n');
    fprintf('Sistema %d\n',i);
    fprintf('========================\n');

    %% Lazo cerrado

    T = feedback(G{i},1);

    %% Polos

    p = pole(T);

    fprintf('Polos del lazo cerrado:\n');
    disp(p)

    %% Estabilidad

    p = pole(T);

    if all(real(p) < 0)

        fprintf('Sistema ESTABLE\n');

    elseif any(real(p) > 0)

        fprintf('Sistema INESTABLE\n');

    else

        fprintf('Sistema MARGINALMENTE ESTABLE\n');

    end
    %% Escalon

    figure;
    step(T,t);
    grid on;
    title(['Escalon - Sistema ',num2str(i)])

    %% Rampa

    figure;
    lsim(T,rampa,t);
    grid on;
    title(['Rampa - Sistema ',num2str(i)])

end
