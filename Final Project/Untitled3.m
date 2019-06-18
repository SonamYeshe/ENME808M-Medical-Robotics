%unit = (markers_cam(3,1) - markers_cam(1,1))/(centroids(3,1) - centroids(1,1));
%unit
% p_rb_ee = [129+aa; -158.75+bb; cc; 1];
% p_rb_ee(1) = 129;
% aa
% steps = zeros(3,1);
% steps(1) = 2;
% for i = 1:3
%     if(steps(i)) >0
%         steps(i) = -steps(i);
%     end
% end
% steps
% dir = [1;2;1];
% revdir = zeros(3,1);
% for i = 1:3
%     if(dir(i) == 1)
%         revdir(i) = 2;
%     else
%         revdir(i) = 1;
%     end
% end
% revdir(1)
% port_name = 'COM4';
% arduino=serial(port_name,'BaudRate',9600);
% fopen(arduino);
% % pause(3)
% % fprintf(arduino, '%s', char(3));
% % fprintf(arduino, '%s', char(revdir(3))); 
% % fprintf(arduino, '%u', floor(steps(3))); % send answer variable content to arduino
% pause(3)
% fprintf(arduino, '%s', char(2));
% fprintf(arduino, '%s', char(revdir(2))); 
% fprintf(arduino, '%u', floor(steps(2)/2)); % send answer variable content to arduino
% pause(3)
% fprintf(arduino, '%s', char(1));
% fprintf(arduino, '%s', char(revdir(1))); 
% fprintf(arduino, '%u', floor(steps(1))); % send answer variable content to arduino
fclose(arduino);