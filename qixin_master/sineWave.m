function EEG_new = sineWave(EEG,feature,A_rate,savename,savepath)
% 编码调制正弦波，模拟EEG在特定峰值上增强
% input: 
% EEG: 要调制的EEG数据
% feature: 提取周期特征(必须先运行XiPi程序)
% A_rate: 幅度调制比率
% savename: 预存文件名
% savepath: 预存路径
% output: 
% 调制后的EEG数据

    center = feature(1,:);
    power = feature(2,:);
    f_sine = center;%调制频率
    A_sine = power;%调制幅度

    data = EEG.data;

    for i = 1:length(f_sine)
        % 生成正弦波
        fs = EEG.srate; % 采样率
        t = 0:1/fs:EEG.pnts/EEG.srate-1/fs; % 时间向量
        f = f_sine(i); % 频率
        A = A_sine(i) * A_rate; % 幅度
        y = A*sin(2*pi*f*t); % 正弦波

        % 将正弦波与EEG数据相加
        data = data + y;
    end

    % 创建新的EEG结构体
    EEG_new = EEG;
    EEG_new.data = data;
    pop_saveset(EEG_new,'filename',savename,'filepath',savepath);
    
end