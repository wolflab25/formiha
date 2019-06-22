redlamp1=0
greenlamp1=1
redlamp2=2
greenlamp2=3
redlamp3=4
greenlamp3=5

vote1=0
vote2=0
vote3=0

gpio.mode(redlamp1,gpio.OUTPUT) 
gpio.write(redlamp1,gpio.HIGH)
gpio.mode(greenlamp1,gpio.OUTPUT) 
gpio.write(greenlamp1,gpio.HIGH)
gpio.mode(redlamp2,gpio.OUTPUT) 
gpio.write(redlamp2,gpio.HIGH)
gpio.mode(greenlamp2,gpio.OUTPUT) 
gpio.write(greenlamp2,gpio.HIGH)
gpio.mode(redlamp3,gpio.OUTPUT) 
gpio.write(redlamp3,gpio.HIGH)
gpio.mode(greenlamp3,gpio.OUTPUT) 
gpio.write(greenlamp3,gpio.HIGH)

dofile("settings.lua")
dofile("wifi.lua")
--Start HTTP 'server'
dofile("httpd.lua")
print("Ready")

