function dy = state_eqs(t, y)

    % Parameters
    m = 100; % kg
    S = 14; % m^2
    CD0 = 0.034; % zero drag coefficient
    K = 0.07; % induced drag coefficient
    g = 9.81;
    rho = 1.13; % kg/m^3, air density
    
    % Variables
    %x = y(1);
    %h = y(2);
    v = y(3);
    gamma = y(4);

    % Lift coefficient, depends on time, alpha omitted
    CL = 0.4 + 0.1*cos(0.1*t);
    
    L = total_lift(CL, S, rho, v);
    D = total_drag(CD0, K, CL, S, rho, v);
    
    dy = [v*cos(gamma);
          v*sin(gamma);
          -(D/m + g*sin(gamma));
          (L - m*g*cos(gamma)) / (v*m);];
end

function L = total_lift(CL, S, rho, v)
    q = air_density(rho,v);
    L = CL*S*q;
end

function D = total_drag(CD0, K, CL, S, rho, v)
    q = air_density(rho,v);
    D = (CD0 + K*CL^2)*S*q;
end

function q = air_density(rho,v)
    q = 0.5*rho*v^2;
end