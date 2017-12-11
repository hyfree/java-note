<!DOCTYPE html>
<html>
  <head>
    <title>${title} | 猿笔记</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<!-- editormd css -->
	<link rel="stylesheet" href="${rootpath}/assets/editor.md-master/css/editormd.css" />
	<link rel="stylesheet" href="/note/assets/css/amazeui.min.css" />

  </head>
  
  <body>
	<div style="margin-left:20px; margin-right:20px; margin-top:20px; ">
		<div class="am-u-md-12">
			<h1 style="text-align: center;">${title}
			</h1>
			<hr "/>

			<div id="main-body" class="markdown-body editormd-preview-container" previewcontainer="true" style="padding: 20px;">
				${content}
			</div>
		</div>
	</div>
	<script src="${rootpath}/assets/js/jquery-3.2.1.min.js"></script>
	
  </body>
</html>
