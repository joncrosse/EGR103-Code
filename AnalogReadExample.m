clear();
a = arduino('com5','uno');
a2 = arduino('com4','uno', 'Libraries','Servo');
pins={'D8', 'D9', 'D10', 'D11'};
steps={'1100', '0110', '0011','1001'};

servoMotor = servo(a2,'D12');

steps_size=size(steps,2);                        %steps = 4

x = 2;
writePosition(servoMotor, .8);

AllValues = 0;
for index = 1:5               % Run values 2 through 5
       analogNow =(1023/5)*readVoltage(a,'A0'); % Read from arduino pin A0
       % Adds all values for test
       AllValues =  analogNow+ AllValues;
end 
count = 0;

sensReading = AllValues/5;

while count < 6;
if sensReading > 600
   for i = 1:43:86

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .6);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
   
   for i = 86:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
end

if sensReading >= 400 && sensReading <= 500
   for i = 1:2:172

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .6);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
    
   for i = 172:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
end


if sensReading > 300 && sensReading < 400;
   for i = 86:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .6);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
    
   for i = 1:2:86

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
end



if sensReading > 200 && sensReading < 300
   for i = 172:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .6);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
    
   for i = 1:2:172

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
end



if sensReading > 100 && sensReading < 200
   for i = 260:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .6);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
   
   for i = 1:2:260

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
   
   count = count +1;
end;
end


% for i = 1:86
% 
%     step = steps{mod(i,steps_size)+1};      % step=1,2,3,4
% 
%     for j=1:4
%         writeDigitalPin(a, pins{j}, str2double(step(j)));
%     end
% 
%     %pause(0.01);
% 
% end
