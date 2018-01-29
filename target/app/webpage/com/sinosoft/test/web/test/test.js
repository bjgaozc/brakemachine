$(function() {
	$("#formobj").Validform({
		tiptype : 2,
		btnSubmit : "#btn_sub",
		btnReset : "#btn_reset",
		ajaxPost : true,
		callback : function(data) {
			var win = frameElement.api.opener;
			if (data.success == true) {
				frameElement.api.close();
				win.tip(data.msg);
			} else {
				if (data.responseText == ''
						|| data.responseText == undefined) {
					$.messager.alert('错误', data.msg);
					$.Hidemsg();
				} else {
					try {
						var emsg = data.responseText.substring(
								data.responseText.indexOf('错误描述'),
								data.responseText.indexOf('错误信息'));
						$.messager.alert('错误', emsg);
						$.Hidemsg();
					} catch (ex) {
						$.messager.alert('错误', data.responseText + "");
						$.Hidemsg();
					}
				}
				return false;
			}
			win.reloadTable();
		}
	});
});
