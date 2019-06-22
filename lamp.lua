print ("button pressed")
--collectgarbage()	
if GET['number'] == "1" then
	if vote1==0 then
		if GET['lamp'] == "red" then
			gpio.write(redlamp1,gpio.LOW)
			vote1=1
			print ("red lamp 1 on")
		end
		if GET['lamp'] == "green" then
			gpio.write(greenlamp1,gpio.LOW)
			vote1=1
			print ("green lamp 1 on")
		end
	end
end	

if GET['number'] == "2" then
	if vote2==0 then
		if GET['lamp'] == "red" then
			gpio.write(redlamp2,gpio.LOW)
			vote2=1
			print ("red lamp 2 on")
		end
		if GET['lamp'] == "green" then
			gpio.write(greenlamp2,gpio.LOW)
			vote2=1
			print ("green lamp 2 on")

		end
	end
end	

if GET['number'] == "3" then
	if vote3==0 then
		if GET['lamp'] == "red" then
			gpio.write(redlamp3,gpio.LOW)
			vote3=1
			print ("red lamp 3 on")

		end
		if GET['lamp'] == "green" then
			gpio.write(greenlamp3,gpio.LOW)
			vote3=1
			print ("green lamp 3 on")
		end
	end
end	


if (vote1+vote2+vote3)==3 then
	for i=1,15000 do 
		tmr.wdclr()
	end 
	vote1=0
	vote2=0
	vote3=0;
	gpio.write(redlamp1,gpio.HIGH)
	gpio.write(greenlamp1,gpio.HIGH)
	gpio.write(redlamp2,gpio.HIGH)
	gpio.write(greenlamp2,gpio.HIGH)
	gpio.write(redlamp3,gpio.HIGH)
	gpio.write(greenlamp3,gpio.HIGH)
	print ("all lamps off")
end	