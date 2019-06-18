%% configuration
% select which targer you want to hit
target_select=2;

rb_thirdmotor_offset = [-120, +158.75, -55];
thirdmotor_needletip_offset = [-14, -3, -95];

offset_x= -9;
offset_y= -26;
offset_z= -13;

%% transformation matrix from robot base to camera
h_rb_c = [1 0   0   127;
          0 1   0   -56.5;
          0 0   1   -186;
          0 0   0   1];
      
%% end effector position in the robot base frame
%p_rb_ee = [120+x; -158.75+y; z; 1];
       
%% transformation matrix from camera to fiducials
h_c_fid = [1    0    0   0;
           0    1    0   0;
           0    0    1   Z;
           0    0    0   1];
       
%% positon of first fiducial in the fiducial frame
unit_x = (markers_cam(3,1) - markers_cam(2,1))/(centroids(3,1) - centroids(2,1));
unit_y = (markers_cam(2,2) - markers_cam(1,2))/(centroids(2,2) - centroids(1,2));
p_fid_fid1 = [(centroids(1,1)-KK(1,3))*unit_x; (centroids(1,2)-KK(2,3))*unit_y; 0; 1];

%% calculation for motor movements : x,y,z
p_rb_ee = h_rb_c * h_c_fid * p_fid_fid1; 

tar1_fid1_position = [44, -5, 50];
tar2_fid1_position = [79, 17, 50];
tar3_fid1_position = [111, -3, 50];

% 55/90
switch target_select
    case 1
x = p_rb_ee(1) + rb_thirdmotor_offset(1) + thirdmotor_needletip_offset(1) + tar1_fid1_position(1)+ offset_x;
y = p_rb_ee(2) + rb_thirdmotor_offset(2) + thirdmotor_needletip_offset(2) + tar1_fid1_position(2)+ offset_y;
z = p_rb_ee(3) + rb_thirdmotor_offset(3) + thirdmotor_needletip_offset(3) + tar1_fid1_position(3)+ offset_z;
    case 2
x = p_rb_ee(1) + rb_thirdmotor_offset(1) + thirdmotor_needletip_offset(1) + tar2_fid1_position(1)+ offset_x;
y = p_rb_ee(2) + rb_thirdmotor_offset(2) + thirdmotor_needletip_offset(2) + tar2_fid1_position(2)+ offset_y;
z = p_rb_ee(3) + rb_thirdmotor_offset(3) + thirdmotor_needletip_offset(3) + tar2_fid1_position(3)+ offset_z;
    case 3
x = p_rb_ee(1) + rb_thirdmotor_offset(1) + thirdmotor_needletip_offset(1) + tar3_fid1_position(1)+ offset_x;
y = p_rb_ee(2) + rb_thirdmotor_offset(2) + thirdmotor_needletip_offset(2) + tar3_fid1_position(2)+ offset_y;
z = p_rb_ee(3) + rb_thirdmotor_offset(3) + thirdmotor_needletip_offset(3) + tar3_fid1_position(3)+ offset_z;
end
%% motor moving distance from steps to realworld
% motor 1&2
stepsPerRevolution = 200;
pitchLeadscrew = 2;
%x = 10;
%y = 10;
steps = zeros(3,1);
steps(1) = stepsPerRevolution / 4 * (x / pitchLeadscrew);
steps(2) = stepsPerRevolution / 4 * (y / pitchLeadscrew);
%expectedMovingDistatance = 10;
%steps12 = stepsPerRevolution / 4 * (expectedMovingDistatance / pitchLeadscrew);

% motor 3
%z = 10;
pitchDiameter = 12.7;
steps(3) = stepsPerRevolution * z / (pi * pitchDiameter);

%% motor rotation direction
dir = zeros(3,1);
for i = 1:2
    if(steps(i)) < 0
        steps(i) = - steps(i);
        dir(i) = 2;
    else
        dir(i) = 1;
    end
end

if(steps(3)) < 0
    steps(3) = - steps(i);
    dir(3) = 1;
else
    dir(3) = 2;
end
revdir = zeros(3,1);
for i = 1:3
    if(dir(i) == 1)
        revdir(i) = 2;
    else
        revdir(i) = 1;
    end
end
%%
% Setup Arduino Connection
port_name = 'COM4';
arduino=serial(port_name,'BaudRate',9600);

%%
fopen(arduino);
pause(3)
fprintf(arduino, '%s', char(1));
fprintf(arduino, '%s', char(dir(1))); 
fprintf(arduino, '%u', floor(steps(1))); % send answer variable content to arduino
pause(3)
fprintf(arduino, '%s', char(2));
fprintf(arduino, '%s', char(dir(2))); 
fprintf(arduino, '%u', floor(steps(2))); % send answer variable content to arduino
pause
fprintf(arduino, '%s', char(3));
fprintf(arduino, '%s', char(dir(3))); 
fprintf(arduino, '%u', floor(steps(3))); % send answer variable content to arduino
pause
fprintf(arduino, '%s', char(3));
fprintf(arduino, '%s', char(revdir(3))); 
fprintf(arduino, '%u', floor(steps(3))); % send answer variable content to arduino
pause
fprintf(arduino, '%s', char(2));
fprintf(arduino, '%s', char(revdir(2))); 
fprintf(arduino, '%u', floor(steps(2))); % send answer variable content to arduino
pause(3)
fprintf(arduino, '%s', char(1));
fprintf(arduino, '%s', char(revdir(1))); 
fprintf(arduino, '%u', floor(steps(1))); % send answer variable content to arduino
fclose(arduino);