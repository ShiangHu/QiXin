function EEG = preproData(filename,filepath,savename,savepath)
% 原始数据预处理模块，采用ica独立成分分析
% 读取原始数据，其中包括.vhdr，.eeg，.vmrk文件
% input: 
% filename: 原始数据名 (.vhdr 文件)
% filepath: 数据路径
% savename: 预存数据名
% savepath: 预存路径
% output: 
% EEG: 输出预处理后的EEG数据
% 保存数据以.set,.edf 文件格式至预存路径

    %导入数据
    EEG = pop_loadbv(filepath, filename);
    % 'filepath '是.vhdr文件的路径,  'filename' 是.vhdr文件的名称. 此代码将导入.vhdr,.vmrk,
    % 和.EEG 三种文件

    %降采样至128
    EEG = pop_resample( EEG, 128);

    %过滤 1-60Hz的波
    EEG = pop_eegfiltnew(EEG, 'locutoff',1,'hicutoff',60);

    %凹陷滤波 50 48-52
    EEG = pop_eegfiltnew(EEG, 'locutoff',48,'hicutoff',52,'revfilt',1);

    %Detached electrode
    %EEG = pop_select( EEG, 'rmchannel',{'M1','M2','HEO','VEO','TRIGGER'});

    %Interpolation T7
    %Check whether there is a bad guide section

    % ICA独立成分分析
    EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');

    %识别和删除伪迹
    EEG = pop_iclabel(EEG, 'default');
    EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
    EEG = pop_subcomp( EEG, [], 0);

    %平均参考
    EEG = pop_reref( EEG, []);

    %保存数据
    pop_saveset(EEG,'filename',savename,'filepath',savepath);
    
end