var filter = "win16|win32|win64|mac|macintel";
var dateLength;

if ( navigator.platform ) {
	if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
		//mobile
		//alert('mobile 접속');
		//applyToDevice = "vertical";
		dateLength = 7; 
	} else {
		//pc
		//alert('pc 접속');
		//applyToDevice = "horizontal";
		dateLength = 10;
	}
}

