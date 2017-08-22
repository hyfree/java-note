<html>
<head>

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--markdown editor start-->
<!--<link rel="stylesheet" href="assets/editor.md-master/examples/css/style.css" />-->
<link rel="stylesheet"
	href="${basePath}/assets/editor.md-master/css/editormd.css" />
<link rel="stylesheet" href="${basePath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${basePath}/assets/css/admin.css">
<!--自定义样式-->
<link rel="stylesheet" href="${basePath}/assets/css/programer.css">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<style>
* {
	margin: 0px;
}
</style>
<body>
	<div style="height: 50px; background-color: dodgerblue; line-height: 50px; color: white;">
		<p style="padding-left: 10px;">Programer 猿笔记</p>
	</div>
	<div id="main-body" style="background-color: #EEEEEE;">
		<!-- 菜单区域 -->
		<div id="menuarea" style="min-width: 240px; width: 10%; height: 100%; float: left; border-right:2px solid #EEEEEE; overflow-y:auto ">
			
			<div class="menu">
            	<div style="height:80px;">
            		<div style="width:50%; text-align:center; float:left; margin-top:15px;">
            			<a id="addFile" style="cursor:pointer"><span><i class="am-icon-folder-open-o am-icon-md"></i><br/>文件夹</span></a>
            		</div>
            		<div style="width:50%; text-align:center; float:left; margin-top:15px;">
            			<a id="addNote" style="cursor:pointer"><span><i class="am-icon-file-text-o am-icon-md"></i><br/>笔记</span></a>
            		</div>
            	</div>
            	
                <ul>
                    <li><a href="#"><i class="am-icon-bars"></i> <span>最新笔记</span></a></li>
                </ul>
                
                <ul>
                    <li><a href="#"><i class="am-icon-pencil-square-o"></i> <span>我的笔记</span></a></li>
                    <ul class="menu-node" id="types">
                        ${types}
                    </ul>
                </ul>
                <ul>
                    <li><a href="#"><i class="am-icon-trash-o"></i> <span>回收站</span></a></li>
                </ul>
            </div>
		
		</div>
		<!-- 笔记列表区域 -->
		<div id="notesarea" style="min-width: 240px; width: 10%; height: 100%; float: left; background-color:white;"></div>
		<!-- 写笔记区域 -->
		<div id="writearea" style="height: 100%; overflow-y: auto">
			<div id="toolbar">
				<div class="am-input-group am-input-group-sm">
                    <input id="n_title" type="text" placeholder="请输入标题" class="am-form-field">
                    <span class="am-input-group-btn">
                        <button class="am-btn am-btn-default" type="button" id="saveBtn">保存</button>
                        <!-- <button class="am-btn am-btn-default" type="button">在线演示</button> -->
                        <!-- <button class="am-btn am-btn-default" type="button">分享</button> -->
                    </span>
                </div>
			</div>
			<div id="test-editormd" >
            	<textarea style="display:none; id="content"></textarea>
            </div>
		</div>
	</div>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<!--<![endif]-->
    <script src="${basePath}/assets/js/amazeui.min.js"></script>
    <script src="${basePath}/assets/js/app.js"></script>
    <!--markdown editor js -->
    <script src="${basePath}/assets/editor.md-master/editormd.min.js"></script>
    
    <script type="text/javascript">
    	var testEditor;
    	function initEditor(mdtext){
    		$("#content").val(mdtext);
            testEditor = editormd("test-editormd", {
                width: "100%",
                height: "95%",
                syncScrolling: "single",
                path: "${basePath}/assets/editor.md-master/lib/",
                emoji: true,
                watch : true, 
                imageUpload : true,
				imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
				imageUploadURL : "index?method=upload",
				saveHTMLToTextarea : true,
                toolbarIcons: function () {
                    return ["undo", "redo", "|", "bold", "hr", "italic", "|", "emoji", "list-ul", "link", "reference-link", "image", "table", "pagebreak", "|", "preformatted-text", "code", "code-block",  "search","preview"]
                }
            });
    	}
       
    </script>
    
	<script>
		$(function() {
			//初始化编辑器
			initEditor("Hello World");
			$("#main-body").height(document.body.clientHeight - 50);
			
			$('#notesarea').on('click','ul li a',function(){
				var id = $(this).attr('data');
				$.ajax({
	    			type: "post",
	                url: "index?method=findNoteById",
	                data: { id: id},
	                dataType: "text",
	                success: function (result) {//请求正确执行的方法（后台返回的结果）
	                	//alert(result);
	                	initEditor(result);
	                	//$("#content").val(result);
	                	// testEditor.previewing();	
	                	//$("#alertTitle").addClass("am-btn-success");
						//$("#alertMsg").html($(".editormd-html-textarea").html());
						//$("#alertInfo").modal('open');
						//alert(testEditor.getHTML());
	                	//$("#test-editormd").html(result);
		                //$("#content").css('display','none');
					}
	    		});
			});
			
			$("#types").on('click','li a',function(){
				var typeid = $(this).attr('data');
				$.ajax({
	    			type: "post",
	                url: "index?method=findNoteByTypeId",
	                data: { typeid: typeid},
	                dataType: "text",
	                success: function (result) {//请求正确执行的方法（后台返回的结果）
	                	$("#notesarea").html(result);
					}
	    		});
			});
		});
		
		$("#saveBtn").click(function(){
			alert("-");
    		//弹出框
    		$('#noteDialog').modal({
				  relatedTarget: this,
				  onConfirm: function(e) {
    					var typeid = $("#selects").val();
					    $.ajax({
			    			type: "post",
			                url: "index?method=add",
			                data: { title: $("#n_title").val(),mdtext:$("#content").val(),content:$(".editormd-preview").html(),typeid:typeid },
			                dataType: "text",
			                success: function (result) {//请求正确执行的方法（后台返回的结果）
									
								if(result=="ok"){
									$("#alertTitle").addClass("am-btn-success")
									$("#alertMsg").html("添加成功");
									$("#alertInfo").modal('open');
									$("#content").val("Hello World");
									//初始化编辑器
									initEditor("Hello World");
								}
							}
			    		});
				  },
				  onCancel: function(e) {
		       		
		      	  }
		    });
    	});

		$(window).resize(function() { //当浏览器大小变化时
			$("#main-body").height(document.body.clientHeight - 50);
			$("#writearea").width(document.body.clientWidth- ($("#menuarea").width() + $("#notesarea").width()));
			//alert(document.body.clientHeight - 50 + ":" + document.body.clientHeight);
			//alert($(window).height());          //浏览器时下窗口可视区域高度
			//alert($(document).height());        //浏览器时下窗口文档的高度
			//alert($(document.body).height());   //浏览器时下窗口文档body的高度
			//alert($(document.body).outerHeight(true)); //浏览器时下窗口文档body的总高度 包括border padding margin
		});
		
		
	</script>
</body>
</html>
