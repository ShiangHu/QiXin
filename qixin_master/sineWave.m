function EEG_new = sineWave(EEG,feature,A_rate,savename,savepath)
% ����������Ҳ���ģ��EEG���ض���ֵ����ǿ
% input: 
% EEG: Ҫ���Ƶ�EEG����
% feature: ��ȡ��������(����������XiPi����)
% A_rate: ���ȵ��Ʊ���
% savename: Ԥ���ļ���
% savepath: Ԥ��·��
% output: 
% ���ƺ��EEG����

    center = feature(1,:);
    power = feature(2,:);
    f_sine = center;%����Ƶ��
    A_sine = power;%���Ʒ���

    data = EEG.data;

    for i = 1:length(f_sine)
        % �������Ҳ�
        fs = EEG.srate; % ������
        t = 0:1/fs:EEG.pnts/EEG.srate-1/fs; % ʱ������
        f = f_sine(i); % Ƶ��
        A = A_sine(i) * A_rate; % ����
        y = A*sin(2*pi*f*t); % ���Ҳ�

        % �����Ҳ���EEG�������
        data = data + y;
    end

    % �����µ�EEG�ṹ��
    EEG_new = EEG;
    EEG_new.data = data;
    pop_saveset(EEG_new,'filename',savename,'filepath',savepath);
    
end