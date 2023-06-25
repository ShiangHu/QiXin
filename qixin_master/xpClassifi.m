function [XiPi,feature] = xpClassifi()
% 使用XIPI工具箱提取神经震荡表征参数
% input: 
% 选择.set脑电数据集文件(需要预处理);
% output: 
% XiPi: 含有周期分离后的XIPI结构;
% feature: 提取的特征，包括中心点和振幅;

    % 导入数据，需要eeglab支持
    XiPi = xp_importdata([]);

    % calculateSpec
    XiPi = xp_calculateSpec(XiPi,[400 600],50);

    % separateSepc
    XiPi = xp_separateSepc(XiPi);
    
    % parameterization
    XiPi = xp_parameterize(XiPi);

    % 特征提取
    center = [];
    power = [];

    pi_paras = fieldnames(XiPi.parameters.pi_paras);

    for i = 1:XiPi.nbchan
        peaks = getfield(XiPi.parameters.pi_paras,pi_paras{i});
        per_peaks = fieldnames(peaks);
        for j = 1:length(per_peaks)
            value = getfield(peaks,per_peaks{j});
            
            %提取中心点在0-50Hz之间的功率大于0的周期性神经震荡表征参数;
            if 0<value.center && value.center<50 && value.power>0 
                center = [center value.center];
                power = [power value.power];
                
            end
        end
    end
    
    %results
    feature = [center ;power];
    
end

% plot(XiPi.freq,XiPi.spectra);

% plot
% XiPi = xp_plot(XiPi,1:31);