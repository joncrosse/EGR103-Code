clear();
a = arduino('com5','uno');
a2 = arduino('com4','uno', 'Libraries','Servo');
pins={'D8', 'D9', 'D10', 'D11'};
steps={'1100', '0110', '0011','1001'};
sensorPin = 'A0';

servoMotor = servo(a2,'D12');

steps_size=size(steps,2);                        %steps = 4

x = 2;
writePosition(servoMotor, .8);

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
if (sensReading < 1.2427 && sensReading > 1.1027)
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
if (sensReading < 1.4875 && sensReading > 1.2500)
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
if sensReading < 1.6053 && sensReading > 1.5156;
    disp('ALUMINUM')
   for i = 86:-2:1

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
if sensReading < 3.7284 && sensReading > 3.3234;
    disp('paper')
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
if sensReading < 4.2923 && sensReading > 4.2875;
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
if (sensReading < 4.0373 && sensReading > 4.0321)
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
