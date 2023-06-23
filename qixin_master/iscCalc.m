function ISC = iscCalc(EEG1,EEG2,savename,savepath)
% �ϲ�˫��EEG���ݲ�����Ϊ.mat��ʽ,����ISC
% input: �����˵�EEG���ݣ�����
% EEG1 EEG2: ����ʵ���ߵ�EEG����
% savename: Ԥ���ļ�����.mat��ʽ��
% savepath: Ԥ��·��
% output:
% ISC: �Լ�isc

    % Load the two EEG datasets
    % EEG1 = pop_loadset('filename',filename_1,'filepath',filepath);
    % EEG2 = pop_loadset('filename',filename_2,'filepath',filepath);

    %��ƬEEG����
    EEG1 = pop_select(EEG1,'time',[410 420]);
    EEG2 = pop_select(EEG2,'time',[410 420]);

    % Merge the two datasets into one
    %EEG = pop_mergeset(EEG1, EEG2);
    
    % �����������Ե��Ե�����
    X = [];
    X(:,:,1) = EEG1.data';
    X(:,:,2) = EEG2.data';
    fs = EEG1.srate;
    badchannels = [];
    eogchannels = [];
    
    %�������� ��ʽΪ*.mat
    save([savepath savename],'X','fs','badchannels','eogchannels');

    %ISC ���㼰���ͼ��
    [ISC,~,~,~,~] = isceeg([savepath savename],'BioSemi28.loc',0.5,5,1);
    
end