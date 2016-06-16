
$(function() {
	var url = window.location.href;
	var category = url.split("=")[1];
	console.log("/js/board_js/boardbackground.js : " + category)
	switch (category) {
	case "1":
		$("body").css("background", "url(http://192.168.8.13:8088/img/background/eventBg.jpg)");
		$("body").css("background-size", "cover");
		break;
	case "2":
		$("body").css("background", "url(http://192.168.8.13:8088/img/background/eventBg.jpg)");
		$("body").css("background-size", "cover");
		break;
	case "3":
		$("body").css("background", "url(http://192.168.8.13:8088/img/background/eventBg.jpg)");
		$("body").css("background-size", "cover");
		break;
	case "4":
		$("body").css("background", "url(http://192.168.8.13:8088/img/background/eventBg.jpg)");
		$("body").css("background-size", "cover");
		break;
	default:
		break;

	}
});