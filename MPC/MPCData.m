clc
clear
Ts = 900;
fileName = 'DataCalibGray2005_6.xlsx';
Data = readtable(fileName);
[u1,w1,y1,t1] = iddData2(Data, Ts);

%% Reference data

refData = readtable('SetPointTemp.xlsx');
aud = refData(1:end,"AUDITORIUM");
aud = table2array(aud);
gym = refData(1:end,"GYM");
gym = table2array(gym);
class = refData(1:end,"CLASSROOMS");
class = table2array(class);

%% State space model 
load("StateSpace.mat");
B_mod = B(1:3,1:3);
D_mod = B(1:3,4:end);
C = eye(3);
D = zeros(3, 11);
L = length(aud);
t_ref = t1(1:L);
inputs = [t_ref,u1];
disturbances = [t_ref,w1];
dist.t = t_ref;
dist.value = w1;
refrence = [t_ref,class,aud,gym];
save("RefrenceData","refrence");
Ts = 0.25;
p = 20;
m = 2

plant = ss(A,B,C,D);
plant = setmpcsignals(plant,'MD',[4 5 6 7 8 9 10 11]);
MV1 = struct('Min',0,'Max',75000);
MV2 = struct('Min',0,'Max',7000);
MV3 = struct('Min',0,'Max',43000);
MV = [MV1,MV2,MV3];
MPCobj = mpc(plant,Ts,p,m,[],MV);


%% Post Simulation Data

timeSeries = out.Qh.Time;
Qh_class = out.Qh.Data(:,1);
Qh_aud = out.Qh.Data(:,2);
Qh_gym = out.Qh.Data(:,3);

save("simulinkInputs.mat","timeSeries","Qh_class","Qh_aud","Qh_gym");
%% 
plot(timeSeries,Qh_class);
hold on 
plot(t_ref, u1(:,1));
grid minor 
legend("MPC","OpenStudio");
xtitle("Time (h)");
ytitle("HVAC Heat (W)");
title("Comparison between ideal and optimal heating");

