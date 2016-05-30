var min = new Date().getDate();
$("#flat-slider").slider({
	max : min+14,
	min : min,
	range : true,
	values : [ min, min+4 ]
}).slider("pips", {
	first : "pip",
	last : "pip"
});

$("#flat-slider-vertical-1, #flat-slider-vertical-2, #flat-slider-vertical-3")
		.slider({
			max : 25,
			min : 0,
			range : "min",
			value : 20,
			orientation : "vertical"
		}).slider("pips", {
			first : "pip",
			last : "pip"
		}).slider("float");