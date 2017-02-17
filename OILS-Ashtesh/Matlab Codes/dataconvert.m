% for i=1:39
% % v_r1(i,:)= v_r(i,:)*(10^7)/255;
% v_r_ecef1(i,:)= v_r_ecef(i,:)*(10^7)/255;
% % com_sqrt(i,1)=sqrt((com_data(i,1)^2)+(com_data(i,2)^2)+(com_data(i,3)^2));
% end
% p=5399;
% post=zeros(12001,4);
% for i=1:12001
%     post(i,1) = comp_ss(i,1)+comp_ss(i,2)*2^8;  %+phi(i,3)*2^16+phi(i,4)*2^24;
%     if post(i,1)>2^15
%         post(i,1)=post(i,1)-2^16;
%     end
%     post(i,2) = comp_ss(i,3)+comp_ss(i,4)*2^8;  %+phi(i,3)*2^16+phi(i,4)*2^24;
%     if post(i,2)>2^15
%         post(i,2)=post(i,2)-2^16;
%     end
%     post(i,3) = comp_ss(i,5)+comp_ss(i,6)*2^8;  %+phi(i,3)*2^16+phi(i,4)*2^24;
%     if post(i,3)>2^15
%         post(i,3)=post(i,3)-2^16;
%     end
%     post(i,4)= comp_ss(i,7);
% end
post=zeros(20800,4);
for i=1:20800
    post(i,1) = comp_ss(i,1)+comp_ss(i,2)*2^8+comp_ss(i,3)*2^16+comp_ss(i,4)*2^24;  %+phi(i,3)*2^16+phi(i,4)*2^24;
    if post(i,1)>2^31
        post(i,1)=post(i,1)-2^32;
    end
    post(i,2) = comp_ss(i,5)+comp_ss(i,6)*2^8+comp_ss(i,7)*2^16+comp_ss(i,8)*2^24;  %+phi(i,3)*2^16+phi(i,4)*2^24;
    if post(i,2)>2^31
        post(i,2)=post(i,2)-2^32;
    end
    post(i,3) = comp_ss(i,9)+comp_ss(i,10)*2^8+comp_ss(i,11)*2^16+comp_ss(i,12)*2^24;  %+phi(i,3)*2^16+phi(i,4)*2^24;
    if post(i,3)>2^31
        post(i,3)=post(i,3)-2^32;
    end
    post(i,4)= comp_ss(i,13);
end
%     
%     post(i,2) = phi(i,5)+phi(i,6)*2^8+phi(i,7)*2^16+phi(i,8)*2^24;
%     if post(i,2)>2^31
%         post(i,2)=post(i,2)-2^32
%     end
%       post(i,3) = phi(i,9)+phi(i,10)*2^8+phi(i,11)*2^16+phi(i,12)*2^24;
%       if post(i,3)>2^31
%         post(i,3)=post(i,3)-2^32
%       end
% 
% SS_dat=zeros(110844,12);
%     sun1=SS*(1024/3.3);
% SS_dat = zeros(length(sun_sensor_v),12);
% for i=1:length(sun_sensor_v)
% for j=1:6
% SS_dat(i,2*j-1)=(sun_sensor_v(i,j)/256);
% SS_dat(i,2*j)=mod(sun_sensor_v(i,j),256);
% end
% end
