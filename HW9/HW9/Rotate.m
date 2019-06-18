%% UnderGrad
clear all
a=(atan(4.34/109));
Ry0=[cos(a) 0 sin(a);0 1 0;-sin(a) 0 cos(a)];
P1_Actual=[44;49.2;79.6];
P2_Actual=[79;49.2;57.6];
P3_Actual=[109;49.2;77.6];
P_1=[40.96;56.2;79.72];
P_2=[76.3;56.2;59.12];
P_3=[109.89;56.2;79.99];
PR_1=Ry0*P_1;
PR_2=Ry0*P_2;
PR_3=Ry0*P_3;
ErrorT1=norm(PR_1-P1_Actual);
ErrorT2=norm(PR_2-P2_Actual);
ErrorT3=norm(PR_3-P3_Actual);

%% Grad
clear all
temp=3/(156.81-82.9252);
P1_Actual=[44;49.2;79.6];
P2_Actual=[79;49.2;57.6];
P3_Actual=[109;49.2;77.6];
alpha=(atan((156.81-151.62)/(197.97-86.65)));
beta=(atan(temp));
Origin=[86.6524;0;156.81];
P_1=[127.85;56.2;76.17];
P_2=[163.19;56.2;96.77];
P_3=[196.78;56.2;75.9];
P_1_moved=(P_1-Origin).*[1;1;-1];
P_2_moved=(P_2-Origin).*[1;1;-1];
P_3_moved=(P_3-Origin).*[1;1;-1];
Ry0=[cos(alpha) 0 sin(alpha);0 1 0;-sin(alpha) 0 cos(alpha)];
Rx0=[1,0,0;0,cos(beta),-sin(beta);0,sin(beta),cos(beta)];
P_1_moved_cal=Rx0*Ry0*P_1_moved;
P_2_moved_cal=Rx0*Ry0*P_2_moved;
P_3_moved_cal=Rx0*Ry0*P_3_moved;

ErrorT1=norm(P_1_moved_cal-P1_Actual);
ErrorT2=norm(P_2_moved_cal-P2_Actual);
ErrorT3=norm(P_3_moved_cal-P3_Actual);



