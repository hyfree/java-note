<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>笔记添加 | 猿笔记</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- editormd css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/editor.md-master/css/editormd.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">

<!--自定义样式-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/programer.css">

</head>
<body>
	<div
		style="height: 50px; background-color: dodgerblue; line-height: 50px; color: white;">
		<div class="am-g doc-am-g">
			<div class="am-u-md-2">Programer 猿笔记</div>
			<div class="am-u-md-10">
				<div class="am-u-md-6" style="float:right; text-align:right;">
					<span class="am-icon-list-ol" id="showList"
						style="font-size:21px; padding-right:10px;"
						data-am-popover="{theme: 'sm',content: '笔记列表', trigger: 'hover focus'}"></span>
					<span class="am-icon-file-text-o" id="addNote" style="font-size:21px; padding-right:10px;" data-am-popover="{theme: 'sm',content: '添加笔记', trigger: 'hover focus'}"></span>
					<span class="am-icon-user"
						style="font-size:24px; padding-right:10px;"
						data-am-popover="{theme: 'sm',content: '用户信息', trigger: 'hover focus'}"></span>
				</div>
			</div>
		</div>
	</div>
	<div id="toolbar">
		<div class="am-input-group am-input-group-sm">
			<input id="n_title" type="text" placeholder="请输入标题"
				class="am-form-field"> <span class="am-input-group-btn">
				<button class="am-btn am-btn-success" type="button" id="saveDialog">保存</button>
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
			<div class="am-modal-bd" id="alertMsg"></div>
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
				请在下方选择创建在那一个文件夹下面 <select id="selects" class="am-modal-prompt-input">
				</select>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>添加</span>
			</div>
		</div>
	</div>

	<!-- 树节点选择弹框 -->
	<div class="am-modal am-modal-prompt" tabindex="-1" id="zTreeDialog">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">选择文件夹</div>
			<div class="am-u-md-12">
				<div class="am-u-md-12">
					<div class="am-input-group am-input-group-sm">
						<span class="am-input-group-btn">
							<button class="am-btn am-btn-success" id="addParent"
								type="button">添加</button>
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
				<div class="am-u-md-6" style="height:400px; overflow-y:auto ">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				<div class="am-u-md-6" style="height:400px; overflow-y:auto ">
					<div class="am-input-group am-input-group-sm">
						<input id="nodeName" type="text" placeholder="选择文件夹" class="am-form-field"  disabled> 
						<span class="am-input-group-btn">
							<button class="am-btn am-btn-success" type="button" id="saveBtn">保存笔记</button>
							<!-- <button class="am-btn am-btn-default" type="button">在线演示</button> -->
							<!-- <button class="am-btn am-btn-default" type="button">分享</button> -->
						</span>
					</div>
				</div>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>关闭</span>
			</div>
		</div>
	</div>

	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/zTree_v3-master/css/zTreeStyle/zTreeStyle.css"
		type="text/css">


	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/editor.md-master/editormd.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
	


	<!-- editor func js -->
	<script type="text/javascript">
		/*editor func js */
		var testEditor;
		var height = document.body.clientHeight - 80;

		function initMDEditor(mdText) {
			testEditor = editormd(
					"test-editormd",
					{
						width : "100%",
						height : height,
						path : "${pageContext.request.contextPath}/assets/editor.md-master/lib/",
						//theme : "dark",
						//previewTheme : "dark",
						//editorTheme : "pastel-on-dark",
						markdown : mdText,
						codeFold : true,
						//syncScrolling : false,
						saveHTMLToTextarea : true, // 保存 HTML 到 Textarea
						searchReplace : true,
						//watch : false,                // 关闭实时预览
						//htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启    
						//toolbar  : false,             //关闭工具栏
						//previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
						emoji : true,
						taskList : true,
						tocm : true, // Using [TOCM]
						tex : true, // 开启科学公式TeX语言支持，默认关闭
						flowChart : true, // 开启流程图支持，默认关闭
						sequenceDiagram : true, // 开启时序/序列图支持，默认关闭,
						//dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
						//dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
						//dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
						//dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
						//dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
						imageUpload : true,
						imageFormats : [ "jpg", "jpeg", "gif", "png", "bmp",
								"webp" ],
						imageUploadURL : "./php/upload.php"

					});
		}
	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/zTree_v3-master/js/jquery.ztree.core.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/zTree_v3-master/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/zTree_v3-master/js/jquery.ztree.exedit.js"></script>

	<!-- ztree func js -->
	<script src="${pageContext.request.contextPath}/assets/js/programer.js"></script>
	
	<script type="text/javascript">
		$("#addNote").click(function(){
			window.location.href = "index"
		});
		
		$("#showList").click(function(){
			window.location.href = "list"
		});
	</script>
</body>
</html>
