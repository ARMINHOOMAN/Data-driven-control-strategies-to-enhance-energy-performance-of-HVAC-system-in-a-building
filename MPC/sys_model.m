function [sys] = sys_model(trainingData)
%% Find initial_sys is an idgrey model associated with RCmodel.m.
data = iddData(trainingData);
odefun = 'RCmodel';
%If you want to view the RCmodel function 
%type: type RCmodel.m on Command Window
param = [1.1355070e7/1000,5.056633e6/1000,3.738158e6/1000,0.00070856,0.001390597,0.00202517,0.007477552,0.000690902,0.002475208];
Ts=900;
% Ts=0;
% c1 = 165;
% c2 = 165;
% c3 = 165;
% R1a = 0.2;
% R1c = 0.2;
% R2c = 0.2;
% R2u = 0.2;
% R3a = 0.2;
% R3u = 0.2;
% k1 = 1;
% k3 = 1;
initial_sys = idgrey(odefun,param,'c');
% initial_sys = idgrey(odefun,c1,c2,c3,R1a,R1c,R2c,R2u,R3a,R3u,k1,k3,'cd');

initial_sys.Structure.Parameters.Minimum = param/10; 
initial_sys.Structure.Parameters.Maximum = param*10;
opt = greyestOptions;
opt.SearchMethod='auto';
%opt.SearchMethod='gn';
opt.SearchOption.MaxIter=100;
opt.SearchOption.Tolerance=0.00001;
opt.Focus = 'Prediction';
opt.EnforceStability = true;
% opt.SearchOption.TolFun=1e-6;

opt.Display = 'on';
sys = greyest(data,initial_sys,opt);
end