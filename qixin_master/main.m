% �����񾭽��ɱ���ϵͳ������  ����
% ��ǿѧϰ���
datapath = 'C:\Users\29405\matlab2018a\Matlab2018-a\workspace\eegData\project1\';
mean_isc = 0.002;
feature1 = [];
feature2 = [];
alpha = 0.4;%ѧϰ��
beta = 10;%����ѡ���̽���̶ȣ�betaԽ�󣬶�����ѡ��ĸ���Խ��

% ����Ԥ����
% EEG1 = preproData('H4.vhdr',datapath,'H4_ica.set',datapath);
% EEG2 = preproData('W4.vhdr',datapath,'H7_ica.set',datapath);

% ��ȡ˫��EEG����
EEG1 = pop_loadset('filename','H4_ica.set','filepath',datapath);
EEG2 = pop_loadset('filename','H7_ica.set','filepath',datapath);

% �����Լ�ISCָ��
isc = iscCalc(EEG1,EEG2,'H4-H7.mat',datapath);

mean_isc_old = mean_isc;

mean_isc = mean_isc + alpha*(mean(isc) - mean_isc);

%�̼����Լ�iscͬ����ǿ�ٷֱ�;
syn = (mean_isc - mean_isc_old)/mean_isc_old;

% �õ����𵴱�������
if true%mean_isc - mean_isc_old < 0 %�ͷ�
    [XiPi1,feature1] = xpClassifi();
    [XiPi2,feature2] = xpClassifi();
end

% ����̼�����
EEG1 = sineWave(EEG1,feature1,0.5*(1+syn),'H4_ica_1',datapath);
EEG2 = sineWave(EEG2,feature2,0.5*(1+syn),'H7_ica_1',datapath);

%EEG1_1 = pop_loadset('filename','H4_ica_1.set','filepath',datapath);
%EEG2_1 = pop_loadset('filename','H7_ica_1.set','filepath',datapath);
isc = iscCalc(EEG1,EEG2,'H4-H7_1.mat',datapath);
mean_isc = mean(isc) - mean_isc;