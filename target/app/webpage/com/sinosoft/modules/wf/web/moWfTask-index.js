/* 全局变量 begin  */
var moWfTaskIndex = {};
/* 全局变量 end  */



/**
 * 初始化
 * 
 * @author cmh
 * @since 2016-10-23 11:59
 * @version 1.0
 */
moWfTaskIndex.initAll = function(){
	setTimeout(function(){
		new $.zui.Messager('提示消息：成功', {
		    type: 'success' // 定义颜色主题
		}).show();
		
		$('#myBoards').boards({
		    drop: function(e){
		        $.zui.messager.show(e.element.text() + " 拖放到 " + e.target.closest('.board').find('.panel-heading').text());
		    }
		});
	},1000);
};