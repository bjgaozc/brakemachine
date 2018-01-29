<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="plug-in-ui/editor.md/css/editormd.css" />
<script src="plug-in-ui/editor.md/editormd.min.js"></script>
<script type="text/javascript">
	var testEditor;
    $(function() {
        testEditor = editormd("test-editormd", {
            width : "90%",
            //autoHeight : true,
            height:"350px",
            syncScrolling : "single",
            path : "plug-in-ui/editor.md/lib/"
        });
    });
</script>

<br><br>
<div id="test-editormd">
	<textarea style="display:none;"></textarea>
</div>