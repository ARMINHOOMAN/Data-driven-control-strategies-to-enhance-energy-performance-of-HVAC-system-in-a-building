% function [A,B,C,D] = RCmodel(c1,c2,c3,R1a,R1c,R2c,R2u,R3a,R3u,Ts)
function [A,B,C,D] = RCmodel(param,Ts)
% equivalent capacitances
c1 = param(1);
c2 = param(2);
c3 = param(3);
% equivalent resistances
R1a = param(4); 
R1c = param(5);
R2c = param(6);
R2u = param(7);
R3a = param(8);
R3u = param(9);
k1 = 1;
k3 = 1;
A = [(-1/c1)*((1/R1a)+(1/R1c)), 0, 0;
    0, (-1/c2)*((1/R2u)+(1/R2c)), 0; 
    0, 0, (-1/c3)*((1/R3a)+(1/R3u))];

B = [1/c1, 0, 0, 1/c1/R1a, 1/c1/R1c, 0, 1/c1, 0, 0, k1/c1, 0;
    0, 1/c2, 0, 0, 1/c2/R2c, 1/c2/R2u, 0, 1/c2, 0, 0, 0;
    0, 0, 1/c3, 1/c3/R3a, 0, 1/c3/R3u, 0, 0, 1/c3, 0, k3/c3];

C = eye(3);
D = zeros(3, 11);
end
