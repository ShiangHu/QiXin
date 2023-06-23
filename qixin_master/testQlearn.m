%Q-learning 算法框架

isc_sel = [0 0 0];

%探索不同的刺激序列方案
for strate = 1:3
    sel_1 = logical(round(rand(1,length(feature1(1,:)))));
    sel_2 = logical(round(rand(1,length(feature2(1,:)))));
    
    loc_1 = find(sel_1 == 1);
    loc_2 = find(sel_2 == 1);
    
    feature1_new = feature1(:,loc_1);
    feature2_new = feature2(:,loc_2);
    
    EEG1 = sineWave(EEG1,feature1,0.5*(1+syn),['H4_ica_' num2str(strate)],datapath);
    EEG2 = sineWave(EEG2,feature2,0.5*(1+syn),['H7_ica_' num2str(strate)],datapath);
    
    isc_sel(strate) = mean(iscCalc(EEG1,EEG2,['H4-H7_' num2str(strate) '.mat'],datapath));
end

mean_isc_old = mean_isc;

%每种刺激序列的isc
mean_isc = mean_isc + alpha * (isc_sel - mean_isc);

%每种刺激序列的选择概率
P_sel = exp(mean_isc * beta);
P = P_sel/sum(P_sel);

%执行选择动作
select = rand();
if 0 <= select < P(1)
    strate_sel = 1;
elseif P(1) <= select < P(1) + P(2)
    strate_sel = 2;
else
    strate_sel = 3;
end


