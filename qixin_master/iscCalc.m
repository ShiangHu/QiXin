function ISC = iscCalc(EEG1,EEG2,savename,savepath)
% 合并双脑EEG数据并保存为.mat格式,计算ISC
% input: 两个人的EEG数据，保存
% EEG1 EEG2: 两个实验者的EEG数据
% savename: 预存文件名（.mat格式）
% savepath: 预存路径
% output:
% ISC: 脑间isc

    % Load the two EEG datasets
    % EEG1 = pop_loadset('filename',filename_1,'filepath',filepath);
    % EEG2 = pop_loadset('filename',filename_2,'filepath',filepath);

    %切片EEG数据
    EEG1 = pop_select(EEG1,'time',[410 420]);
    EEG2 = pop_select(EEG2,'time',[410 420]);

    % Merge the two datasets into one
    %EEG = pop_mergeset(EEG1, EEG2);
    
    % 联合两名被试的脑电数据
    X = [];
    X(:,:,1) = EEG1.data';
    X(:,:,2) = EEG2.data';
    fs = EEG1.srate;
    badchannels = [];
    eogchannels = [];
    
    %保存数据 格式为*.mat
    save([savepath savename],'X','fs','badchannels','eogchannels');

    %ISC 计算及结果图表
    [ISC,~,~,~,~] = isceeg([savepath savename],'BioSemi28.loc',0.5,5,1);
    
end