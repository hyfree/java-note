<!DOCTYPE html>
<html>
  <head>
    <title>登录页面</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	
	<link rel="icon" type="image/png" href="${basePath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${basePath}/assets/i/app-icon72x72@2x.png">
    <link rel="stylesheet" href="${basePath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${basePath}/assets/css/admin.css">

	

  </head>
  
  <body>
  
  	<!--添加文件夹的弹框-->
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
	  			<input id="loginBtn" type="button" class="am-modal-prompt-input am-btn am-btn-success" value="登录">
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
	            url: "login?method=validate",
	            data: { uname: uname,upwd:upwd},
	            dataType: "text",
	            success: function (result) {//请求正确执行的方法（后台返回的结果）
					if(result=="success"){
						window.location.href="index";
					}else{
						$("#alertTitle").addClass("am-btn-danger")
						$("#alertMsg").html("登录失败<br/>"+result);
						$("#alertInfo").modal('open');
					}
				}
			});
		});
	</script>
  </body>
</html>
