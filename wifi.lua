--WiFi Settup
print ("wifi initialization...")
print ("trying to connect to AP "..cfg['wifi_ssid']..'with pass '..cfg['wifi_pwd']);
station_cfg={}
station_cfg.ssid=cfg['wifi_ssid']
station_cfg.pwd=cfg['wifi_pwd']
wifi.setmode(wifi.STATION)
wifi.sta.config(station_cfg)
if cfg['use_static']==1 then
	print ("set ip address "..cfg['ip_address'])
	wifi.sta.setip({ip=cfg['ip_address'],netmask=cfg['net_mask'],gateway=cfg['default_gateway']})
end

wifi.sta.connect()


tmr.create():alarm(15000, tmr.ALARM_SINGLE, function()
	
	if wifi.sta.status() ~= 5 then
		print("AP unavailable, Waiting...")
		
			print ("starting in AP mode")
			wifi.setmode(wifi.SOFTAP)
			cfg_ap={}
			cfg_ap.ssid=cfg['ap_ssid']..node.chipid()
			cfg_ap.pwd=cfg['ap_pwd']
			wifi.ap.config(cfg_ap)
			wifi.ap.dhcp.start()
			wifi.eventmon.register(wifi.eventmon.AP_STACONNECTED, function(T)
				print("New client connecting to the ESP...")
				end)
			cfg_ap = nil
			print ("done")
			--trying = nil
			print (wifi.ap.getip());

	else
		print("ESP8266 mode is: " .. wifi.getmode())
		print("The module MAC address is: " .. wifi.ap.getmac())
		print("Config done, IP is "..wifi.sta.getip())
		print ("Status "..wifi.sta.status())
	end
	end)





collectgarbage()
