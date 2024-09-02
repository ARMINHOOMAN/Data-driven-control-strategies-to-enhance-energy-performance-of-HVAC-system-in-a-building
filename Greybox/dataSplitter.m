function [y,u,t] = dataSplitter(MyData,splitBegin,splitEnd)
splittedData = MyData(splitBegin:splitEnd,:);
y1 = splittedData(1:end,26);
y2 = splittedData(1:end,25);
y3 = splittedData(1:end,28);
y = [y1,y2,y3];
y.Properties.VariableNames{1} = 'T1_classroom';
y.Properties.VariableNames{2} = 'T2_auditorium';
y.Properties.VariableNames{3} = 'T3_gym';
y = y{:,:}+273;

G1 = splittedData{1:end,6}+splittedData{1:end,9}+splittedData{1:end,12};
G2 = splittedData{1:end,5}+splittedData{1:end,8}+splittedData{1:end,11};
G3 = splittedData{1:end,7}+splittedData{1:end,10}+splittedData{1:end,13};
Q1 = splittedData{1:end,15}-G1;
Q2 = splittedData{1:end,14}-G2;
Q3 = splittedData{1:end,16}-G3;
Ta = splittedData{1:end,30}+273;
Tu = splittedData{1:end,29}+273; 
Tc = splittedData{1:end,27}+273;
Q_sun_1 = splittedData{1:end, 18};
Q_sun_3 = splittedData{1:end, 19};
u = [Q1, Q2, Q3, Ta, Tc, Tu, G1, G2, G3, Q_sun_1, Q_sun_3];
%% time vector
t = splittedData{1:end,1};
end
