var min = new Date().getDate();

$("#flat-slider").slider({
	max : min+dateLength,
	min : min,
	range : true,
	values : [ min, min+4 ],
	//orientation : applyToDevice
}).slider("pips", {
	first : "pip",
	last : "pip"
});

$("#flat-slider-vertical-1, #flat-slider-vertical-2, #flat-slider-vertical-3")
		.slider({
			max : 7,
			min : min,
			range : "min",
			value : 3,
			orientation : "vertical"
		}).slider("pips", {
			first : "pip",
			last : "pip"
		}).slider("float");
