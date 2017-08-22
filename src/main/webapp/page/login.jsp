<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>登录页面 | 猿笔记</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">


</head>
<body>
	
	<div class="am-modal am-modal-prompt" tabindex="-1" id="alertInfo">
		<div class="am-modal-dialog">
			<div class="am-modal-hd" id="alertTitle">系统提示</div>
			<div class="am-modal-bd">
			  	<p style="padding:10px;" id="alertMsg">系统消息</p>
			</div>
			<div class="am-modal-footer">
			  <span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
    <div class="am-g">
	  <div class="am-u-sm-4" style="display: block;float:none;margin-left:auto;margin-right:auto; margin-top:100px;">
	  		<div>
	  			<h2 style="text-align:center;">Program 猿笔记</h2>
	  			<input id="uname" type="text" class="am-modal-prompt-input" placeholder="输入帐号">
	  			<input id="upwd" type="password" class="am-modal-prompt-input" placeholder="输入密码">
	  			<input id="loginBtn" type="button" class="am-modal-prompt-input am-btn am-btn-primary" value="登录">
	  		</div>
	  </div>
	</div>
	
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

 
	<script type="text/javascript">
		$("#loginBtn").click(function(){
			var uname = $("#uname").val();
			var upwd = $("#upwd").val();
			if(uname == ""){
				return;
			}
			if(upwd == ""){
				return;
			}
			$.ajax({
				type: "post",
	            url: "login/validate",
	            data: { uname: uname,upwd:upwd},
	            dataType: "json",
	            success: function (data) {//请求正确执行的方法（后台返回的结果）
					if(data.result=="success"){
						window.location.href="list";
					}else{
						$("#alertTitle").addClass("am-btn-danger")
						$("#alertMsg").html("<br/>"+data.result);
						$("#alertInfo").modal('open');
					}
				}
			});
		});
	</script>
</body>
</html>
