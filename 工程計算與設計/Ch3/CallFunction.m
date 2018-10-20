function [T, x] = CallFunction(m, k, c, delta, t)
% Under-damped free vibrations of a mass-spring-damper system
% Input Arguments:
%     m = Mass, a scalar, SI unit: kg
%     k = Spring constant, a scalar, SI unit: N/m
%     c = Damping constant, a scalar, SI unit: N/(m/s)
%     delta = Initial displacement, a scalar, SI unit: m
%     t = Time, a row vector, SI unit: s
% Output Arguments:
%     T = Period, a scalar, SI unit: s
%     x = Displacement, a row vector of the same length of t, SI unit: m
% On Error, it prints a message and returns:
%     T = 0, a scalar
%     x = 0, a scalar
omega = sqrt(k/m);
cC = 2*m*omega;
if c>= cC
    disp('Not an under-damped system!')
    T = 0; x = 0;
    return;
end
omegaD = omega*sqrt(1-(c/cC)^2);
T = 2*pi/omegaD;
x = delta*exp(-c*t/(2*m)).*(cos(omegaD*t)+c/(2*m*omegaD)*sin(omegaD*t));
end