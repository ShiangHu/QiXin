function [XiPi,feature] = xpClassifi()
% ʹ��XIPI��������ȡ���𵴱�������
% input: 
% ѡ��.set�Ե����ݼ��ļ�(��ҪԤ����);
% output: 
% XiPi: �������ڷ�����XIPI�ṹ;
% feature: ��ȡ���������������ĵ�����;

    % �������ݣ���Ҫeeglab֧��
    XiPi = xp_importdata([]);

    % calculateSpec
    XiPi = xp_calculateSpec(XiPi,[400 600],50);

    % separateSepc
    XiPi = xp_separateSepc(XiPi);
    
    % parameterization
    XiPi = xp_parameterize(XiPi);

    % ������ȡ
    center = [];
    power = [];

    pi_paras = fieldnames(XiPi.parameters.pi_paras);

    for i = 1:XiPi.nbchan
        peaks = getfield(XiPi.parameters.pi_paras,pi_paras{i});
        per_peaks = fieldnames(peaks);
        for j = 1:length(per_peaks)
            value = getfield(peaks,per_peaks{j});
            
            %��ȡ���ĵ���0-50Hz֮��Ĺ��ʴ���0�����������𵴱�������;
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