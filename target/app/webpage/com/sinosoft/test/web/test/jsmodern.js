var m = {
	/**
	 * 初始化
	 * 
	 * @author cmh
	 */
	initAll: function(){
		jsModern.fullPage({
		    navigation: '<div id="myNav"><b>按钮-01</b><b>按钮-02</b><b>按钮-03</b><b>按钮-04</b></div>',
		    background: ['#1BBC9B', '#4BBFC3', '#7BAABE', '#F90'],
		    axis: "y",
		    keyboard: true,
		    callback: [
		        function () { $(this).find("p").fadeIn(1000); },
		        function () { $(this).find("p").fadeIn(1000); },
		        function () { $(this).find("p").fadeIn(1000); },
		        function () { $(this).find("p").fadeIn(1000); }
		    ]
		});
	}

};