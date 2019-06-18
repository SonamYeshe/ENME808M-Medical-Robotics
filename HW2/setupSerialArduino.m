function[flag] = setupSerialArduino(comPort)
% It accept as the entry value, the index of the serial port
% It returns a flag value used to check if when the script is successfully
% executed, the arduino serial object is created and it exists
flag = 1;
global arduino
% Initialize Serial object
arduino = serial(comPort);
set(arduino,'DataBits',8);
set(arduino,'StopBits',1);
set(arduino,'BaudRate',9600);
set(arduino,'Parity','none');
fopen(arduino);
a = 'b';
while (a~='a') 
    a=fread(arduino,1,'uchar');
end
fprintf(arduino,'%c','a');
disp('Serial Communication setup complete...')
end
