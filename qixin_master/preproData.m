function EEG = preproData(filename,filepath,savename,savepath)
% ԭʼ����Ԥ����ģ�飬����ica�����ɷַ���
% ��ȡԭʼ���ݣ����а���.vhdr��.eeg��.vmrk�ļ�
% input: 
% filename: ԭʼ������ (.vhdr �ļ�)
% filepath: ����·��
% savename: Ԥ��������
% savepath: Ԥ��·��
% output: 
% EEG: ���Ԥ������EEG����
% ����������.set,.edf �ļ���ʽ��Ԥ��·��

    %��������
    EEG = pop_loadbv(filepath, filename);
    % 'filepath '��.vhdr�ļ���·��,  'filename' ��.vhdr�ļ�������. �˴��뽫����.vhdr,.vmrk,
    % ��.EEG �����ļ�

    %��������128
    EEG = pop_resample( EEG, 128);

    %���� 1-60Hz�Ĳ�
    EEG = pop_eegfiltnew(EEG, 'locutoff',1,'hicutoff',60);

    %�����˲� 50 48-52
    EEG = pop_eegfiltnew(EEG, 'locutoff',48,'hicutoff',52,'revfilt',1);

    %Detached electrode
    %EEG = pop_select( EEG, 'rmchannel',{'M1','M2','HEO','VEO','TRIGGER'});

    %Interpolation T7
    %Check whether there is a bad guide section

    % ICA�����ɷַ���
    EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');

    %ʶ���ɾ��α��
    EEG = pop_iclabel(EEG, 'default');
    EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
    EEG = pop_subcomp( EEG, [], 0);

    %ƽ���ο�
    EEG = pop_reref( EEG, []);

    %��������
    pop_saveset(EEG,'filename',savename,'filepath',savepath);
    
end