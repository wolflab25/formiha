params=['wifi_ssid','wifi_pwd','ap_ssid','ap_pwd','ip_address','use_static','net_mask','default_gateway','dns_1','login','password','use_auth'];

function loadJSON(json_url, callback) {

    var xobj = new XMLHttpRequest();
    xobj.overrideMimeType("application/json");
    xobj.open('GET', json_url, true);
    xobj.onreadystatechange = function () {
          if (xobj.readyState == 4 && xobj.status == "200") {
            callback(xobj.responseText);
          }
    };
    xobj.send(null);
}

function submit_cfg() {
  url = 'savecfg?';
  for (i=0; i<params.length; i++) {
	ele = document.getElementById(params[i]);
	//if (ele.checkValidity() == false) {
	//	alert("One or more parameters(" + params[i] + ")is wrong. Please check form fields.");
	//	return;
	//}

	if (ele.tagName == 'INPUT') {
		url = url + params[i] + '=' + ele.value + '&';
	}
	if (ele.tagName == 'SELECT') {
        url = url + params[i] + '=' + ele.selectedIndex + '&';
	}
  }

  loadJSON(url, function(response) {
	alert(response);    	
    var json_obj = JSON.parse(response);
	alert(response);
  });
}

function fill_fields(json_obj) {
  for (i=0; i<params.length; i++) {
	ele = document.getElementById(params[i]);
	console.log(ele);
	if (ele.tagName == 'INPUT') {
		ele.value = json_obj.cfg[0][params[i]];
	}
	if (ele.tagName == 'SELECT') {
		ele.selectedIndex = json_obj.cfg[0][params[i]];
	}
  }
}
