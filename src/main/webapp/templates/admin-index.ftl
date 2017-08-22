<html>
<head>
	<title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- editormd css -->
	<link rel="stylesheet" href="${basePath}/assets/editor.md-master/css/editormd.css" />
	
	<link rel="stylesheet" href="${basePath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${basePath}/assets/css/admin.css">
    
	<!--自定义样式-->
	<link rel="stylesheet" href="${basePath}/assets/css/programer.css">

</head>
<body>
	<div style="height: 50px; background-color: dodgerblue; line-height: 50px; color: white;">
		<div class="am-g doc-am-g">
		  <div class="am-u-md-2">Programer 猿笔记</div>
		  <div class="am-u-md-10">
		  		<div class="am-u-md-6" style="float:right; text-align:right;">
		  			<span class="am-icon-list-ol" style="font-size:21px; padding-right:10px;" data-am-popover="{theme: 'sm',content: '笔记列表', trigger: 'hover focus'}"></span>
		  			<span class="am-icon-file-text-o" style="font-size:21px; padding-right:10px;" data-am-popover="{theme: 'sm',content: '添加笔记', trigger: 'hover focus'}"></span>
		  			<span class="am-icon-user"  style="font-size:24px; padding-right:10px;" data-am-popover="{theme: 'sm',content: '用户信息', trigger: 'hover focus'}"></span>
		  		</div>
		  </div>
		</div>
	</div>
	<div id="toolbar">
		<div class="am-input-group am-input-group-sm">
            <input id="n_title" type="text" placeholder="请输入标题" class="am-form-field">
            <span class="am-input-group-btn">
                <button class="am-btn am-btn-success" type="button" id="saveBtn">保存</button>
                <!-- <button class="am-btn am-btn-default" type="button">在线演示</button> -->
                <!-- <button class="am-btn am-btn-default" type="button">分享</button> -->
            </span>
        </div>
	</div>
	<div id="test-editormd" style="z-index:2"></div>
	
	<!--消息提示弹框-->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="infoDialog">
		<div class="am-modal-dialog">
			<div class="am-modal-hd" id="alertTitle">系统提示</div>
			<div class="am-modal-bd" id="alertMsg">
				
			</div>
			<div class="am-modal-footer">
			  <span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	
	<!--添加笔记弹框-->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="typeDialog">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">添加笔记</div>
	    <div class="am-modal-bd">
	      	请在下方选择创建在那一个文件夹下面
	      	<select id="selects" class="am-modal-prompt-input">
			</select>
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>添加</span>
	    </div>
	  </div>
	</div>
	
	<!-- 树节点选择弹框 -->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="zTreeDialog">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">选择文件夹</div>
	    <div class="am-u-md-12">
	    	<div class="am-u-md-12" >
	    		<div class="am-input-group am-input-group-sm">
		            <span class="am-input-group-btn">
		                <button class="am-btn am-btn-success" id="addParent" type="button" id="saveBtn">添加</button>
		                <button class="am-btn am-btn-danger" id="remove" type="button">删除</button>
		                <button class="am-btn am-btn-warning" id="edit" type="button">编辑</button>
		            </span>
		        </div>
	    		<p>
	    		<!-- [ <a id="addParent" href="#" title="增加父节点" onclick="return false;">增加文件夹</a> ]
	    		[ <a id="addLeaf" href="#" title="增加叶子节点" onclick="return false;">增加叶子节点</a> ] -->
	    		<!-- [ <a id="edit" href="#" title="编辑名称" onclick="return false;">编辑名称</a> ]
	    		[ <a id="remove" href="#" title="删除节点" onclick="return false;">删除节点</a> ]</p> -->
	    	</div>
	    	<div class="am-u-md-12" style="height:400px;">
	    		<ul id="treeDemo" class="ztree"></ul>
	    	</div>
    	</div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>关闭</span>
	    </div>
	  </div>
	</div>
	
	<link rel="stylesheet" href="${basePath}/assets/zTree_v3-master/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
	
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<script src="${basePath}/assets/editor.md-master/editormd.min.js"></script>
	<script src="${basePath}/assets/js/amazeui.min.js"></script>
    <script src="${basePath}/assets/js/app.js"></script>
	<script src="${basePath}/assets/js/programer.js"></script>
	
	
	<!-- editor func js -->
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
	
	
	<script type="text/javascript" src="${basePath}/assets/zTree_v3-master/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${basePath}/assets/zTree_v3-master/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="${basePath}/assets/zTree_v3-master/js/jquery.ztree.exedit.js"></script> 
	
	<!-- ztree func js -->
	<script type="text/javascript">
		var zNodes = [];
		var setting = {
			view: {
				selectedMulti: false
			},
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data: {
				keep: {
					parent:true,
					leaf:true
				},
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove
			}
		};
	
		
		var log, className = "dark";
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName) {
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			updateNode((treeNode.id-1),newName);
			return true;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}
	
		var newCount = 1;
		function add(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			isParent = e.data.isParent,
			nodes = zTree.getSelectedNodes(),
			treeNode = nodes[0];
			if (nodes.length == 0) {
				alert("请先选择一个节点");
				return;
			}
			
			if (treeNode) {
				//添加完成 返回一个id
				var num = addNode(treeNode.id,"新建文件夹" + (newCount++));
				//alert(addresult+":"+num);
				//treeNode = zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, isParent:isParent, name:"新建文件夹" + (newCount++)});
				//zTree.editName(treeNode[0]);
			} else {
				treeNode = zTree.addNodes(null, {id:(100 + newCount), pId:1, isParent:isParent, name:"新建文件夹" + (newCount++)});
				alert((100 + newCount));
				alert(addNode(1,"新建文件夹" + (newCount++)));
				zTree.editName(treeNode[0]);
			}
			
		};
		function edit() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			treeNode = nodes[0];
			if (nodes.length == 0) {
				alert("请先选择一个节点");
				return;
			}
			zTree.editName(treeNode);
			//alert(treeNode.name);
			
		};
		function remove(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			treeNode = nodes[0];
			if (nodes.length == 0) {
				alert("请先选择一个节点");
				return;
			}
			var callbackFlag = $("#callbackTrigger").attr("checked");
			zTree.removeNode(treeNode, callbackFlag);
		};
		function clearChildren(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			treeNode = nodes[0];
			if (nodes.length == 0 || !nodes[0].isParent) {
				alert("请先选择一个父节点");
				return;
			}
			zTree.removeChildNodes(treeNode);
		};
		
		
	</script>
</body>
</html>
