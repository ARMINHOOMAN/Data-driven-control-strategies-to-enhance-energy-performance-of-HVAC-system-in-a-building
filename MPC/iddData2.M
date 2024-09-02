function [u,w,y,t] = iddData2(testData, Ts)
    y1 = testData(1:end,21);
    y2 = testData(1:end,20);
    y3 = testData(1:end,23);
    time = testData(1:end,1);
    t = time{:,:};
    y = [y1,y2,y3];
    y.Properties.VariableNames{1} = 'T1_classroom';
    y.Properties.VariableNames{2} = 'T2_auditorium';
    y.Properties.VariableNames{3} = 'T3_gym';
    y = y{:,:};
    % inputs
    % first we need to sum up all the internal gains (electrical equipment,
    % lights, people)
    G1 = testData{1:end,6}+testData{1:end,9}+testData{1:end,12};
    G2 = testData{1:end,5}+testData{1:end,8}+testData{1:end,11};
    G3 = testData{1:end,7}+testData{1:end,10}+testData{1:end,13};
    Q1 = testData{1:end,15};
    Q2 = testData{1:end,14};
    Q3 = testData{1:end,16};
    Ta = testData{1:end,30};
    Tu = testData{1:end,24}; 
    Tc = testData{1:end,22};
    Q_sun_1 = testData{1:end, 18};
    Q_sun_3 = testData{1:end, 19};
    
    u = [Q1, Q2, Q3];
    w = [Ta, Tc, Tu, G1, G2, G3, Q_sun_1, Q_sun_3];
%     testData_idd = iddata(y, u, Ts, 'Name', 'RC model');
%     testData_idd.InputName = {'HVAC heater of classroom', 'HVAC heater of auditorium', 'HVAC heater of gym', ...
%         'Temperature of ambient','Temperature of corridor', 'Temperature of unconditioned zone', ...
%         'Internal gain of classroom', 'Internal gain of auditorium','Internal gain of gym', ...
%         'Solar gain of classroom', 'Solar gain of gym'};
%     testData_idd.InputUnit = {'Watt', 'Watt', 'Watt', ...
%         '°C','°C', '°C', ...
%         'Watt', 'Watt', 'Watt', ...
%         'Watt', 'Watt'};
%     testData_idd.OutputName = {'Temperature of classroom','Temperature of auditorium','Temperature of gym'};
%     testData_idd.OutputUnit = {'°C', '°C', '°C'};
%     testData_idd.Tstart = 15;
%     testData_idd.TimeUnit = 's';
end
