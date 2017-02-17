% cd('D:\Documents and Settings\Administrator\Desktop\OILS');
clear all;
clc;
%load('fake_detumbling.mat');
load('vishalnom_detumb+nom.mat');

PWM_i=0;
for i=1:20800
    Bx(i,1)= i*2;
    By(i,1)= i*2;
    Bz(i,1)= i*2;
    Bx(i,2)= v_Bb_m(i,1);
    By(i,2)= v_Bb_m(i,2);
    Bz(i,2)= v_Bb_m(i,3);
end

[PWM,Bc] = init_magfield_pwm(Bx,By,Bz,PWM_i);

s =serial('COM10');
set(s,'BaudRate',9600,'Databits',8,'Parity','none','Stopbits',2);
fopen(s);
flushinput(s);
countb=1;
countg=6;
counts=1;
n=12001;
rec_PWM = zeros(29201,10);
comp_PWM1 = zeros(12001,4);
comp_PWM2 = zeros(12001,3);
comp_ss=zeros(20800,12);
comp_ss1=zeros(20800,12);
i=1;
poll3=zeros(1000,1);
poll = 0;
flushinput(s);
ans=1

while i<=60000
    poll(i,1)=fread(s,1,'uint8');
    switch poll(i,1)
        case 80
            a = Bc(countb,2:7);
            a = uint8(a);
            fwrite(s,a(1),'uint8');
            fwrite(s,a(2),'uint8');
            
            fwrite(s,a(3),'uint8');
            fwrite(s,a(4),'uint8');
            
            fwrite(s,a(5),'uint8');
            fwrite(s,a(6),'uint8');
            %rec_pwm(i,1) = (i-1)*2;
            for j=1:9
                rec_pwm(countb,j)= fread(s,1,'uint8');
            end
            countb = countb+1;
        case 90
            countg=countb-1;
            a = GPS_data(countg,1:151);
            a = uint8(a);
            for j=1:151
                fwrite(s,a(j),'uint8');
            end
            %         for k=1:12
            %             phi(i,k) = fread(s,1,'uint8');
            %         end
            %countg = countg + 1;
        case 100
            b = SS_bin(counts,1:12);
            b = uint8(b);
            for j=1:12
                fwrite(s,b(j),'uint8');
            end
            for k=1:14
                comp_ss(counts,k) = fread(s,1,'uint8');
            end
             for k=1:14
                comp_ss1(counts,k) = fread(s,1,'uint8');
            end
            counts = counts + 1;
        otherwise
            warning('Unexpected');
    end
    i=i+1
end  