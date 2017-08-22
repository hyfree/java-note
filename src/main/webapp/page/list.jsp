<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>笔记列表 | 猿笔记</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- editormd css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/editor.md-master/css/editormd.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">

<!--自定义样式-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/programer.css">

<style type="text/css">

a:hover{
	cursor: pointer;
}

</style>
</head>
<body>
	<div style="height: 50px; background-color: dodgerblue; line-height: 50px; color: white;">
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
	
	<div id="main-body" class="am-u-md-12" style="padding:0px;">
		<div class="am-u-md-2" style="margin:0px; padding:0px; padding-left:10px; padding-top:10px; border-right: 2px solid dodgerblue; height:100%;" >
			<ul id="menu">
				
			</ul>
		</div>
		<div class="am-u-md-10" style="margin:0px; padding:0px; height:100%;">
			 <div data-am-widget="list_news" class="am-list-news am-list-news-default" >
			  <!--列表标题-->
			    <div class="am-list-news-hd am-cf">
			       <!--带更多链接-->
			        <a href="##" class="">
			          <h2>最新笔记列表</h2>
			            <span class="am-list-news-more am-fr">更多 &raquo;</span>
			        </a>
			    </div>
			  	<div class="am-list-news-bd">
				  	<ul class="am-list">
				  		<c:forEach items="${list }" var ="note">
				      <li class="am-g am-list-item-dated">
				          <a href="${note.nAddress }" class="am-list-item-hd ">${note.nTitle }</a>
				          <span class="am-list-date">${note.nDate }</span>
				      </li>
				      </c:forEach>
				  </ul>
			   </div>
		    </div>
		</div>
		<!-- <div class="am-u-md-7"  style=" height:100%;">
		</div> -->
	</div>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/zTree_v3-master/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/zTree_v3-master/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/zTree_v3-master/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/zTree_v3-master/js/jquery.ztree.exedit.js"></script>
	
	
	<script type="text/javascript">
		
		$(function(){
			initMenu();
			initHeight();
		});
		
		//初始化高度
		
		function initHeight(){
			var height = document.body.clientHeight - 50;
			$("#main-body").height(height);
		}
		
		function initMenu(){
			loadRootNode(0);
			loadRootNode(1);
		}
		
		//加载树形节点
		function loadRootNode(id){
			if(id==0){
				$.ajax({
					type: "get",
			        url: "type/rootNode",
			        data:{id:id},
			        dataType: "json",
			        success: function (data) {//请求正确执行的方法（后台返回的结果）
			        	$("#menu").append(treeHtml(data.result));
					}
				});
			}else{
				if(id==1){
					$.ajax({
						type: "get",
				        url: "type/rootNode",
				        data:{id:id},
				        dataType: "json",
				        success: function (data) {//请求正确执行的方法（后台返回的结果）
				        	$("#"+id).next('ul').html("");
				        	$("#"+id).next('ul').append(treeHtml(data.result));
				        	//$("#"+id).append(treeHtml(data.result));
				        	$("#"+id).next('ul').css('display','block');
						}
					});
				}else{
					if($("#"+id).next('ul').css('display')=="none"){
						$.ajax({
							type: "get",
					        url: "type/rootNode",
					        data:{id:id},
					        dataType: "json",
					        success: function (data) {//请求正确执行的方法（后台返回的结果）
					        	$("#"+id).next('ul').html("");
					        	$("#"+id).next('ul').append(treeHtml(data.result));
					        	//$("#"+id).append(treeHtml(data.result));
					        	$("#"+id).next('ul').css('display','block');
							}
						});
					}else{
						$("#"+id).next('ul').css('display','none');
					}
				}
				
				
			}
			
		} 
		
		//拼接树形菜单
		function treeHtml(data){
			var html = "";
			//遍历
			$.each(data,function(i,item){
				html += '<li style="width:100%;padding-left:20px;">'+
					    '	<a style="display: block; width:100%;" id="'+item.id+'" onclick="loadRootNode('+item.id+')" onselectstart="return false"><span class="am-icon-folder">&nbsp;</span>'+item.name+'</a>'+
						'	<ul style="display: none; margin:0px;">'+
						'	</ul>'+
						'</li>';
			});
			return html;
		}
		
	</script>

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
