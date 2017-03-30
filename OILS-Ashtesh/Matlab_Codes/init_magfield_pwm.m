function [ PWM,Bc ] = init_magfield_pwm(vx,vy,vz,pwm_i)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n=20800;
B = zeros(n,4);
PWM = zeros(n,4);

B1(:,1) = vx(:,1);
B1(:,2) = vx(:,2);
B1(:,3) = vy(:,2);
B1(:,4) = vz(:,2);
for i=1:n
    B(i,:) =  B1(i,:);          %B1(1+20*(i-1),:);
end
B(:,2:4) = 15000*1e4*B(:,2:4);
PWM(:,1) = B(:,1);
%p=downsample(pwm_i,20);
%PWM(1:n,2:4) = pwm_i(1:n,:);
B_copy=B;
B = int16(B);

% Bc = zeros(19,10);
% Bc(:,1) = B(:,1);
% j=2;
%     for i=1:19
%         c = typecast(abs(B(i,j)),'uint8');
%         Bc(i,j) = c(1);
%         Bc(i,j+1) = c(2);
%         if B(i,j)<0
%             Bc(i,j+2) = 1;
%         end
%     end
% j=3;
% for i=1:19
%         c = typecast(abs(B(i,j)),'uint8');
%         Bc(i,j+2) = c(1);
%         Bc(i,j+3) = c(2);
%         if B(i,j)<0
%             Bc(i,j+4) = 1;
%         end
% end
%
% j=4;
% for i=1:19
%         c = typecast(abs(B(i,j)),'uint8');
%         Bc(i,j+4) = c(1);
%         Bc(i,j+5) = c(2);
%         if B(i,j)<0
%             Bc(i,j+6) = 1;
%         end
% end

Bc=zeros(n,7);
Bc(:,1) = B(:,1);
for i=1:n
    for j=2:4
    if B(i,j)>0
         c = typecast(abs(B(i,j)),'uint8');
         Bc(i,2*j-2) = c(2);
         Bc(i,2*j-1) = c(1);
    else
         Nb=65536+B_copy(i,j);
         Nb= uint16(Nb);
         c = typecast(abs(Nb),'uint8');
         Bc(i,2*j-2) = c(2);
         Bc(i,2*j-1) =  c(1);
    end
    end
end
end

