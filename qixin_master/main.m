% 齐心神经节律编码系统主程序  样例
% 增强学习框架
datapath = 'C:\Users\29405\matlab2018a\Matlab2018-a\workspace\eegData\project1\';
mean_isc = 0.002;
feature1 = [];
feature2 = [];
alpha = 0.4;%学习率
beta = 10;%次优选择的探索程度；beta越大，对最优选择的概率越大

% 数据预处理
% EEG1 = preproData('H4.vhdr',datapath,'H4_ica.set',datapath);
% EEG2 = preproData('W4.vhdr',datapath,'H7_ica.set',datapath);

% 读取双人EEG数据
EEG1 = pop_loadset('filename','H4_ica.set','filepath',datapath);
EEG2 = pop_loadset('filename','H7_ica.set','filepath',datapath);

% 计算脑间ISC指标
isc = iscCalc(EEG1,EEG2,'H4-H7.mat',datapath);

mean_isc_old = mean_isc;

mean_isc = mean_isc + alpha*(mean(isc) - mean_isc);

%刺激后脑间isc同步增强百分比;
syn = (mean_isc - mean_isc_old)/mean_isc_old;

% 得到神经震荡表征参数
if true%mean_isc - mean_isc_old < 0 %惩罚
    [XiPi1,feature1] = xpClassifi();
    [XiPi2,feature2] = xpClassifi();
end

% 编码刺激序列
EEG1 = sineWave(EEG1,feature1,0.5*(1+syn),'H4_ica_1',datapath);
EEG2 = sineWave(EEG2,feature2,0.5*(1+syn),'H7_ica_1',datapath);

%EEG1_1 = pop_loadset('filename','H4_ica_1.set','filepath',datapath);
%EEG2_1 = pop_loadset('filename','H7_ica_1.set','filepath',datapath);
isc = iscCalc(EEG1,EEG2,'H4-H7_1.mat',datapath);
mean_isc = mean(isc) - mean_isc;