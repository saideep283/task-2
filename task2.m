clc;
clear all;
close all;
rec=audiorecorder(8000,16,1);
disp('Start Recording')
recordblocking(rec,10);
disp('Recorded');
y=getaudiodata(rec);
folder=uigetdir(path,'Save the file');
file=input('Enter the Folder Name: ','s');
filename=strcat(file,'.wav');
filename=strcat(folder,'\',filename);
disp('The path for the saved file is: ');
disp(filename);
audiowrite(filename,y,10000);
[y,Fs]=audioread(filename);
get(rec)
Ac=10;
fs=8000;
fc=2000;
t=[1:10*fs]'/fs;
wc=2*pi*fc*t;
c=Ac*cos(wc);
method=menu('Select the type of Modulation','Amplitude Modulation','Frequency Modulation');
switch method
    case 1
        v=modulate(y,fc,fs,'am');
        x=demod(v,fc,fs,'am');     
        subplot(2,2,1);
        plot(t',y);
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('AUDIO SIGNAL');
        subplot(2,2,2);
        plot(t(1:200),c(1:200))
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('CARRIER SIGNAL');
        grid on;
        subplot(2,2,3);
        plot(t',v)
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('AMPLITUDE MODULATED SIGNAL');
        grid on;
        subplot(2,2,4);
        plot(t',x)
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('DEMODULATED SIGNAL');
        grid on;
        pause(10);
        sound(x)
    case 2
        v=modulate(y,fc,fs,'fm'); 
        x=demod(v,fc,fs,'fm');   
        subplot(4,1,1); 
        plot(t',y);
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('MODULATING SIGNAL');
        subplot(4,1,2);
        plot(t(1:200),c(1:200))
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('CARRIER SIGNAL');
        grid on;
        subplot(4,1,3);
        plot(t',v)
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('FREQUENCY MODULATED SIGNAL');
        grid on;
        subplot(4,1,4);
        plot(t',x)
        xlabel('TIME-->');
        ylabel('AMPLITUDE-->');
        title('DEMODULATED SIGNAL');
        grid on;
        pause(10);
        sound(x)
end