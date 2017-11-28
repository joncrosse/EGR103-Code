clear();
a = arduino('/dev/cu.usbmodem1421','uno');
a2 = arduino('/dev/cu.usbmodem1411','uno', 'Libraries','Servo');
pins={'D8', 'D13', 'D12', 'D11'};
steps={'1100', '0110', '0011','1001'};
sensorPin = 'A0';

servoMotor1 = servo(a,'D7');
servoMotor2 = servo(a,'D2');
servoMotor3 = servo(a,'D3');
servoMotor4 = servo(a,'D4');
servoMotor5 = servo(a,'D5');
servoMotor6 = servo(a,'D6');

steps_size=size(steps,2);                        %steps = 4

x = 2;
writePosition(servoMotor1, .4);
writePosition(servoMotor2, .3);
writePosition(servoMotor3, .3);
writePosition(servoMotor4, .3);
writePosition(servoMotor5, .3);
writePosition(servoMotor6, .3);


count = 0;
while count <=5
    AllValues = 0;
    for index = 1:1:100               % Run values 2 through 5
       lightLevel = readVoltage(a2, sensorPin);
       writeDigitalPin(a2, 'D8', 1);
       disp(lightLevel)
       % Adds all values for test
       if index >40
       AllValues =  lightLevel+ AllValues;
        end
    end 

sensReading = AllValues/60;
disp(sensReading);

%steel
if (sensReading < 1.999 && sensReading > 1.7)
   disp('STEEL')
   for i = 1:2:86

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end
   end

    %pause(5);
   
   pause(1);
      writePosition(servoMotor1, 1);
      pause(.2);
      writePosition(servoMotor1, .4)
      pause(2);
   
   for k = 86:-2:1

    step = steps{mod(k,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
%    writePosition(servoMotor2, .8)
%    pause(.8)
%    writePosition(servoMotor2, .3)
   pause(1);
   allValues = 0;
end

%sandpaper
if (sensReading < 3 && sensReading > 2.5)
    disp('SANDPAPER')
   for i = 1:2:172

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor1, 1);
      pause(.2);
      writePosition(servoMotor1, .4)
      pause(2);
    
   for i = 172:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
%    writePosition(servoMotor2, .8)
%    pause(.8)
%    writePosition(servoMotor2, .3)
   pause(1);
   allValues = 0;
end

%aluminum
if sensReading < 2.2 && sensReading > 2.0
    disp('ALUMINUM')
   for i = 86:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor1, 1);
      pause(2);
      writePosition(servoMotor1, .4)
      pause(2);
    
   for i = 1:2:86

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
%    writePosition(servoMotor2, .8)
%    pause(.8)
%    writePosition(servoMotor2, .3)
   pause(1);
   allValues = 0;
end


%paper
if sensReading < 4.2 && sensReading > 4.0
    disp('PAPER')
   for i = 172:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor1, 1);
      pause(.2);
      writePosition(servoMotor1, .4)
      pause(2);
    
   for i = 1:2:172

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
%    writePosition(servoMotor2, .8)
%    pause(.8)
%    writePosition(servoMotor2, .3)
   pause(1);
   allValues = 0;
end


%clear
if sensReading < 4.85 && sensReading > 4.61
    disp('CLEAR')
   for i = 260:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor1, 1);
      pause(.2);
      writePosition(servoMotor1, .4)
      pause(2);
   
   for i = 1:2:260

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
%    writePosition(servoMotor2, .8)
%    pause(.8)
%    writePosition(servoMotor2, .3)
   pause(1);
   allValues = 0;
   
   
end

%cloth
if (sensReading < 4.6 && sensReading > 4.4)
    disp('CLOTH')
   for i = 1:2:260

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end
   end

    %pause(5);
   
  pause(1);
      writePosition(servoMotor1, 1);
      pause(.2);
      writePosition(servoMotor1, .4)
      pause(2);
   
   for k = 260:-2:1

    step = steps{mod(k,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
%    writePosition(servoMotor2, .8)
%    pause(.8)
%    writePosition(servoMotor2, .3)
   pause(1);
   allValues = 0;
end
count = count +1;
if count == 1
    writePosition(servoMotor2, .7);
      pause(.2);
      %writePosition(servoMotor3, .4)
elseif count == 2
    writePosition(servoMotor3, .7);
      pause(.2);
      %writePosition(servoMotor3, .4)
      
elseif count == 3
   writePosition(servoMotor4, .6);
      pause(.2);
      %writePosition(servoMotor4, .4) 
      
elseif count == 4
    pause(1.5)
   writePosition(servoMotor5, .7);
      pause(.2);
      %writePosition(servoMotor5, .4) 

elseif count == 5
    pause(5)
   writePosition(servoMotor6, .7);
      pause(.2);
      %writePosition(servoMotor6, .4) 
end
index = 1;
end
writePosition(servoMotor1, .4);
writePosition(servoMotor2, .3);
writePosition(servoMotor3, .3);
writePosition(servoMotor4, .3);
writePosition(servoMotor5, .3);
writePosition(servoMotor6, .3);
      