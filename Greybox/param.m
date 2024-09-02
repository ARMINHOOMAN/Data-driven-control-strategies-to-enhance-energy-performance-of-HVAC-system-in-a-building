function y = paramFun(B)
c1 = 1/B(1,1);
c2 = 1/B(2,2);
c3 = 1/B(3,3);
R1a = 1/c1/B(1,4); 
R1c = 1/c1/B(1,5);
R2c = 1/c2/B(2,5);
R2u = 1/c2/B(2,6);
R3a = 1/c3/B(3,4);
R3u = 1/c3/B(3,6);
y = [c1,c2,c3,R1a,R1c,R2c,R2u,R3a,R3u];

end 
