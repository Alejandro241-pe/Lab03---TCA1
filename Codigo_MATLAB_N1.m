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

%% VECTOR DE FRECUENCIAS

w = logspace(-2,2,5000);

%% ANALISIS

for i = 1:length(G)

    fprintf('\n========================\n');
    fprintf('Sistema %d\n',i);
    fprintf('========================\n');

    %% Margenes

    [GM,PM,Wcg,Wcp] = margin(G{i});

    if isinf(GM)
        fprintf('Margen de ganancia = Infinito\n');
    else
        fprintf('Margen de ganancia = %.2f dB\n',20*log10(GM));
    end

    if isinf(PM)
        fprintf('Margen de fase = Infinito\n');
    else
        fprintf('Margen de fase = %.2f grados\n',PM);
    end

    fprintf('Wcg = %.4f rad/s\n',Wcg);
    fprintf('Wcp = %.4f rad/s\n',Wcp);

    %% Respuesta en frecuencia

    H = squeeze(freqresp(G{i},w));

    mag = 20*log10(abs(H));

    phase = unwrap(angle(H))*180/pi;

    %% Ajuste de fase
    % Para mostrar la misma rama usada en teoria

    while max(phase) > 0
        phase = phase - 360;
    end

    %% BODE

    figure

    %=====================
    % MAGNITUD
    %=====================

    subplot(2,1,1)

    semilogx(w,mag,'LineWidth',2)

    hold on
    grid on

    yline(0,'k--')

    if Wcp > 0
        xline(Wcp,'g--')
    end

    if Wcg > 0
        xline(Wcg,'r--')
    end

    ylabel('Magnitud (dB)')

    title(['Sistema ',num2str(i)])

    legend('Magnitud',...
           '0 dB',...
           'Wcp (PM)',...
           'Wcg (GM)',...
           'Location','best')

    %=====================
    % FASE
    %=====================

    subplot(2,1,2)

    semilogx(w,phase,'LineWidth',2)

    hold on
    grid on

    yline(-180,'k--')

    if Wcp > 0
        xline(Wcp,'g--')
    end

    if Wcg > 0
        xline(Wcg,'r--')
    end

    xlabel('\omega (rad/s)')
    ylabel('Fase (grados)')

    legend('Fase',...
           '-180°',...
           'Wcp (PM)',...
           'Wcg (GM)',...
           'Location','best')

end
