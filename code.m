clear all;clc;close all;
% �ɸ��Ĳ���
cfgFileName = 'Profile.cfg';
comportStandardNum = 5;%USB�˿ں�
comportEnhancedNum = 6;%USB�˿ں�
loadCfg = 1;%�ϵ����߸ı䲨�β������һ�βɼ�������Ϊ1
% �ظ�����
cnt = 1;
while(cnt > 0)
cnt = cnt - 1;
% ��ȡ�����ݴ洢��adcData��
[adcData,numAdcSamples,sampleRate,freqSlopeConst,numChirps] = ...
    GetRawData(cfgFileName,comportStandardNum,comportEnhancedNum,loadCfg);
loadCfg = 0;
% rx1~4 ��ʾ�ĸ��������ߵĽ����ź�
% rx1Ϊһ������ÿһ�б�ʾһ֡chirp�ز�����������֡��
% �����źŴ�������
rx1 = reshape(adcData(1,:),numAdcSamples,[]);
rx2 = reshape(adcData(2,:),numAdcSamples,[]);
rx3 = reshape(adcData(3,:),numAdcSamples,[]);
rx4 = reshape(adcData(4,:),numAdcSamples,[]);

% �Խ����ź�ֱ��fft���ɻ�ȡ��ֹĿ��ľ�����Ϣ
% fft�������������ʵ�ʾ���Ķ�Ӧ��ϵ��Ҫ����
%rangeFFT1 = fft(rx1,numAdcSamples);% ��ÿһ�н���fft
%figure; 
%tmp = abs(rangeFFT1);
%plot(abs(rangeFFT1));
%xlabel('FFT index')
%ylabel('Amplitude')

% �Խ��յ��ź����ݾ��󣬽���2άfft����ȡ����-�ٶ�ƽ��
% ��ֵ��Ӧ��Ŀ��ľ�����ٶ�
point_plane = get_point_plane(rx1,rx2,rx3,rx4,numAdcSamples,sampleRate,freqSlopeConst,numChirps);
% save 3.mat rx1,rx2,rx3,rx4,numAdcSamples,sampleRate,freqSlopeConst,numChirps;
end
