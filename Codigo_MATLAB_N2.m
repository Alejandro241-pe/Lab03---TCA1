clc;
clear;
close all;
s = tf('s');
% Funciones SIN k
G{1} = (s+1)/(s^3);
G{2} = (s+1)/(s*(s+2)*(s^2+s+1));
G{3} = (s+3)/(s*(s+1)*(s+2));
G{4} = 1/((s+2)*(s-5));
G{5} = (s+1)/((s+5)*(s^2-9));
G{6} = (s+1)/(s*(s-1));
k_values = logspace(-3,3,20000);
PM_objetivo = 45;
tol = 0.5;
warning('off','all') % Oculta warnings molestos
for i = 1:length(G)
    encontrado = false;
    mejor_error = inf;
    mejor_k = NaN;
    mejor_PM = NaN;
    for j = 1:length(k_values)
        k = k_values(j);
        try
            L = k*G{i};
            [GM,PM,Wcg,Wcp] = margin(L);
            % Ignorar resultados invalidos
            if isnan(PM) || isinf(PM)
                continue
            end
            error_actual = abs(PM - PM_objetivo);
            % Guardar el mejor encontrado
            if error_actual < mejor_error
                mejor_error = error_actual;
                mejor_k = k;
                mejor_PM = PM;
            end
            % Si ya está cerca de 45°
            if error_actual < tol
                encontrado = true;
                break
            end
        catch
            continue
        end
    end
    fprintf('\n=====================\n');
    fprintf('Sistema %d\n',i);
    if encontrado
        fprintf('k ≈ %.5f\n',k);
        fprintf('PM ≈ %.2f grados\n',PM);
    else
        fprintf('No exacto. Mejor aproximacion:\n');
        fprintf('k ≈ %.5f\n',mejor_k);
        fprintf('PM ≈ %.2f grados\n',mejor_PM);
    end
end
warning('on','all')
