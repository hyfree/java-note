<!doctype html>
<html class="no-js fixed-layout">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <title>${title}</title>
    <link rel="icon" type="image/png" href="${basePath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${basePath}/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${basePath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${basePath}/assets/css/admin.css">

    <!--markdown editor start-->
    <!--<link rel="stylesheet" href="assets/editor.md-master/examples/css/style.css" />-->
    <link rel="stylesheet" href="${basePath}/assets/editor.md-master/css/editormd.css" />

    <!--自定义样式-->
    <link rel="stylesheet" href="${basePath}/assets/css/programer.css">

</head>

<body>

	<!--添加文件夹的弹框-->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="alertInfo">
		<div class="am-modal-dialog">
			<div class="am-modal-hd" id="alertTitle">系统提示</div>
			<div class="am-modal-bd" id="alertMsg">
			  	<%--<p style="padding:10px;" >系统消息</p>
			--%></div>
			<div class="am-modal-footer">
			  <span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	
	
    <header class="am-topbar am-topbar-inverse admin-header">

        <div class="am-topbar-brand">
            <strong>${sys_name}</small>
        </div>
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
                <li class="am-dropdown" data-am-dropdown>
                    <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                        <span class="am-icon-user"></span> haojieli <span class="am-icon-caret-down"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="#"><span class="am-icon-user"></span> 资料</a></li>
                        <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                        <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                    </ul>
                </li>
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
            </ul>
        </div>
    </header>
    <div class="am-cf admin-main">
        <!-- sidebar start -->
        <div class="admin-sidebar am-offcanvas">
            <div class="menu">
            	<div style="height:80px;">
            		<div style="width:50%; text-align:center; float:left; margin-top:15px;">
            			<a id="addFile" style="cursor:pointer"><span><i class="am-icon-folder-open-o am-icon-md"></i><br/>文件夹</span></a>
            		</div>
            		<div style="width:50%; text-align:center; float:left; margin-top:15px;">
            			<a id="addNote" style="cursor:pointer"><span><i class="am-icon-file-text-o am-icon-md"></i><br/>笔记</span></a>
            		</div>
            	</div>
        		
        		<!--添加文件夹弹框-->
				<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
				  <div class="am-modal-dialog">
				    <div class="am-modal-hd">添加文件夹</div>
				    <div class="am-modal-bd">
				      	请在下方输入要添加的文件夹名称
				      	<input type="text" class="am-modal-prompt-input">
				    </div>
				    <div class="am-modal-footer">
				      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
				      <span class="am-modal-btn" data-am-modal-confirm>添加</span>
				    </div>
				  </div>
				</div>
				
				<!--添加笔记弹框-->
				<div class="am-modal am-modal-prompt" tabindex="-1" id="noteDialog">
				  <div class="am-modal-dialog">
				    <div class="am-modal-hd">添加笔记</div>
				    <div class="am-modal-bd">
				      	请在下方选择创建在那一个文件夹下面
				      	<input type="text" class="am-modal-prompt-input">
				      	<select id="selects" data-am-selected required>
						  </select>
				    </div>
				    <div class="am-modal-footer">
				      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
				      <span class="am-modal-btn" data-am-modal-confirm>添加</span>
				    </div>
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
        <!-- sidebar end -->

        <!-- note list start -->
        <div class="admin-sidebar" style="width:260px !important; background-color: white">
            <div class="am-input-group am-input-group-sm" style="width: 251px; position: fixed; ">
                <input type="text" class="am-form-field">
                <span class="am-input-group-btn">
                    <button class="am-btn am-btn-default" type="button">搜索</button>
                </span>
            </div>
            <div style="margin-top:50px;" id="notes">
                <!--<ul class="note-ul">
                    <li><a href="#">Java JDBC连接demo</a></li>
                    <li>
                        <span style="font-size: 12px; float: left;">2017-04-01 16:06</span>
                        <span style="font-size: 12px; float: right;">haojieli</span>
                    </li>
                </ul>
                -->
            </div>
        </div>
        <!-- note list end -->


        <!-- content start -->
        <div class="admin-content">
            <div class="admin-content-body" style="height: 100%;">
                <div class="am-input-group am-input-group-sm">
                    <input id="n_title" type="text" placeholder="请输入标题" class="am-form-field">
                    <span class="am-input-group-btn">
                        <button class="am-btn am-btn-default" type="button" id="saveBtn">保存</button>
                        <button class="am-btn am-btn-default" type="button">在线演示</button>
                        <button class="am-btn am-btn-default" type="button">分享</button>
                    </span>
                </div>
                <div id="layout">
                	<div id="showContent"></div>
                    <div id="test-editormd">
                        <textarea style="display:none; z-index:100000" id="content"></textarea>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--[if lt IE 9]>
    <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
    <script src="assets/js/amazeui.ie8polyfill.min.js"></script>
    <![endif]-->

    <!--[if (gte IE 9)|!(IE)]><!-->
    <!--<script src="assets/js/jquery.min.js"></script>-->
    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <!--<![endif]-->
    <script src="${basePath}/assets/js/amazeui.min.js"></script>
    <script src="${basePath}/assets/js/app.js"></script>

    <!--markdown editor js -->
    <script src="${basePath}/assets/editor.md-master/editormd.min.js"></script>

    <!--菜单显示隐藏-->
    <script>
        $(".menu ul li").click(function () {
            var ul = $(this).find("ul");
            ul.toggle(500);
        });
    </script>


    <script type="text/javascript">
    	var testEditor;
    	function initEditor(mdtext){
    		$("#content").val(mdtext);
            testEditor = editormd("test-editormd", {
                width: "100%",
                height: "500px",
                syncScrolling: "single",
                path: "${basePath}/assets/editor.md-master/lib/",
                emoji: true,
                watch : false, 
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
    	$("#saveBtn").click(function(){
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
    	
    	
    	//弹框js
		$(function() {
			
			//初始化编辑器
			initEditor("Hello World");
			//加载选项
			loadSelect();
			//加载笔记
			loadAllNote();
			
			$('#notes').on('click','ul li a',function(){
				var id = $(this).attr('data');
				$.ajax({
	    			type: "post",
	                url: "index?method=findNoteById",
	                data: { id: id},
	                dataType: "text",
	                success: function (result) {//请求正确执行的方法（后台返回的结果）
	                	initEditor(result);
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
	                	$("#notes").html(result);
					}
	    		});
			});
			
			$('#addFile').on('click', function() {
			    $('#my-prompt').modal({
					  relatedTarget: this,
					  onConfirm: function(e) {
						    var title = e.data;
						    //添加到数据库
					    	$.ajax({
				    			type: "post",
				                url: "index?method=typeAdd",
				                data: { title: title},
				                dataType: "text",
				                success: function (result) {//请求正确执行的方法（后台返回的结果）
				                	if(result=="success"){
					                	$("#alertTitle").addClass("am-btn-success")
										$("#alertMsg").html("添加成功");
										$("#alertInfo").modal('open');
										
										//重新加载类型
										loadAllType();
				                	}else{
				                		$("#alertTitle").addClass("am-btn-danger")
										$("#alertMsg").html(result);
										$("#alertInfo").modal('open');
				                	}
									
								}
				    		})
					  },
					  onCancel: function(e) {
			       		
			      	  }
			    });
			});
			
		});
		
		
		//加载所有的类型
		function loadType(){
			$.ajax({
    			type: "post",
                url: "index?method=getAllType",
                dataType: "text",
                success: function (result) {//请求正确执行的方法（后台返回的结果）
                	//刷新类型
                	$("#types").html(result);
				}
    		})
		}
		
		//加载下拉列表选项数据
		function loadSelect(){
			$.ajax({
    			type: "post",
                url: "index?method=getAllTypeSelect",
                dataType: "text",
                success: function (result) {//请求正确执行的方法（后台返回的结果）
                	//刷新类型
                	$("#selects").html(result);
				}
    		})
		}
		
		//加载笔记
		function loadAllNote(){
			$.ajax({
    			type: "post",
                url: "index?method=findAllNote",
                dataType: "text",
                success: function (result) {//请求正确执行的方法（后台返回的结果）
                	//刷新类型
                	$("#notes").html(result);
				}
    		})
		}
		
		//添加笔记
		$("#addNote").click(function(){
			initEditor("Hello World !");
		});
    </script>
</body>

</html>

