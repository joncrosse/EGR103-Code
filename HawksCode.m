clear();
a = arduino('com5','uno');
a2 = arduino('com4','uno', 'Libraries','Servo');
pins={'D8', 'D9', 'D10', 'D11'};
steps={'1100', '0110', '0011','1001'};
sensorPin = 'A0';

servoMotor1 = servo(a,'D7');
servoMotor2 = servo(a,'D2');
%servoMotor3 = servo(a,'D3');
%servoMotor4 = servo(a,'D4');
%servoMotor5 = servo(a,'D5');
%servoMotor6 = servo(a,'D6');

steps_size=size(steps,2);                        %steps = 4

x = 2;
writePosition(servoMotor1, .4);
writePosition(servoMotor2, .3);
%writePosition(servoMotor3, .5);
%writePosition(servoMotor4, .5);
%writePosition(servoMotor5, .5);
%writePosition(servoMotor6, .5);

AllValues = 0;
count = 0;
while count < 1
    for index = 1:1:100               % Run values 2 through 5
        if index >10 && index < 80
       lightLevel = readVoltage(a2, sensorPin);
       writeDigitalPin(a2, 'D8', 1);
       disp(lightLevel)
       % Adds all values for test
       AllValues =  lightLevel+ AllValues;
        end
    end 

sensReading = AllValues/70;
disp(sensReading);

%steel
if (sensReading < 1.5997 && sensReading > 1.5000)
   disp('STEEL')
   for i = 1:2:86

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end
   end

    %pause(5);
   
   pause(1);
      writePosition(servoMotor, .4);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
   
   for k = 86:-2:1

    step = steps{mod(k,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
   allValues = 0;
end

%sandpaper
if (sensReading < 2.0875 && sensReading > 1.9105)
    disp('SANDPAPER')
   for i = 1:2:172

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .4);
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
   allValues = 0;
end

%aluminum
if sensReading < 3.3500 && sensReading > 1.7156;
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
      pause(.2);
      writePosition(servoMotor1, .3)
      pause(2);
    
   for i = 1:2:86

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
   allValues = 0;
end


%paper
if sensReading < 3.4584 && sensReading > 3.3104;
    disp('PAPER')
   for i = 172:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .4);
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
   allValues = 0;
end


%clear
if sensReading < 4.2923 && sensReading > 3.9000;
    disp('CLEAR')
   for i = 260:-2:1

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(5);

   end 
   
   pause(1);
      writePosition(servoMotor, .4);
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
   allValues = 0;
   
   
end

%cloth
if (sensReading < 3.8773 && sensReading > 3.6321)
    disp('CLOTH')
   for i = 1:2:260

    step = steps{mod(i,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end
   end

    %pause(5);
   
   pause(1);
      writePosition(servoMotor, .4);
      pause(.2);
      writePosition(servoMotor, .8)
      pause(2);
   
   for k = 260:-2:1

    step = steps{mod(k,steps_size)+1};      % step=1,2,3,4

    for j=1:4
        writeDigitalPin(a, pins{j}, str2double(step(j)));
    end

    %pause(0.01);

   end
   pause(1);
   allValues = 0;
end
count = count +1;
end
