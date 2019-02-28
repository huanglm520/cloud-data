<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey" %>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="cn">
<script type="text/javascript">
	function GetPath() {
		return "<%=path%>";
	}
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册用户(第2/4步) - Cloud-Data 数据一体化服务平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/passport.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/register.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>

</head>
<body>
	<div class="topbar">
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="https://huanglm520.github.io/cloud-data.static.io/images/cloud.svg">
			</div>
			<div class="topbarspan">
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化服务平台</span>
			</div>
			<div class="timer">
				<span class="timer" id="timer">正在获取服务器时间</span>
			</div>
			<div class="user">
				<span class="user">注册用户(第2/4步)</span>
			</div>
		</div>
	</div>
    <div class="passport">
    	<!-- 绘制进度条 -->
    	<div class="progress">
    		<a href="<%=path%>/passport/register/step1"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">1</span>
    			</div>
    		</div></a>
    		<div class="p_line used"></div>
    		<a href="<%=path%>/passport/register/step2"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">2</span>
    			</div>
    		</div></a>
    		<div class="p_line unused"></div>
    		<a href="<%=path%>/passport/register/step3"><div class="p_number unused">
    			<div class="p_number_inner">
    				<span class="p_number">3</span>
    			</div>
    		</div></a>
    		<div class="p_line unused"></div>
    		<a href="<%=path%>/passport/register/step4"><div class="p_number unused">
    			<div class="p_number_inner">
    				<span class="p_number">4</span>
    			</div>
    		</div></a>
    	</div>
    	
    	<div class="info">
    	
    		<div style="width: 400px; margin-top: 20px; text-align: center;" id="error">
    			<span class="error" v-show="isFailed"></span>
    		</div>
    	
    		<div class="hint">
    			<span class="hint">请输入密码</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="password" id="password" />
    		</div>
    		<div class="hint">
    			<span class="hint">请确认密码</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="password" id="repasswd" />
    		</div>

    		<div class="line">
    			<hr />
    		</div>
    		
    		<div class="submit">
    			<button class="submit" id="submit">下一步</button>
    		</div>
    		
    		<!-- 绘制底部链接 -->
    		<div class="bottom">
    			<div class="b_left">
    				<a href="<%=path%>/passport/register/step1"><span class="bottom">返回上一步</span></a>
    			</div>
    			<div class="b_right">
    				<a href="<%=path %>/passport/login"><span class="bottom">已有账号</span></a>
    			</div>
    		</div>
    		
    	</div>
    </div>
    
    <div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	    
	</div>
    
    <!-- 建立vue对象，用于控制页面错误信息 -->
    <script type="text/javascript">
    	var $error = new Vue({
    		el: "#error",
    		data: {
    			isFailed: false
    		}
    	});
    </script>
    
    <script type="text/javascript">
	    $(document).ready(function() {
			// 对鼠标事件进行监听
			$("#submit").mouseover(function() {
				// 鼠标划过事件
				$("#submit").animate({"background-color": "#40A0E2"}, 200);
			});
			$("#submit").mouseout(function() {
				// 鼠标划出事件
				$("#submit").animate({"background-color": "#0070D2"}, 200);
			});
			
			// 绑定回车提交事件
			document.onkeydown = function() {
				if (event.keyCode == 13) {
					submit();
				}
			}
		});
    </script>
    
    <!-- 建立按钮的启用与禁用方法 -->
    <script type="text/javascript">
   		function disable() {
   			$("#submit").attr("disabled", "true");
   			$("#submit").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
   			$("#submit").text("正在提交...");
   		}
   		function enable() {
   			$("#submit").removeAttr("disabled");
   			$("#submit").css({"background-color": "#0070D2", "cursor": "pointer"});
   			$("#submit").text("下一步");
    	}
    </script>
    
    <!-- 绑定提交事件 -->
    <script type="text/javascript">
    	
    	$("#submit").click(function() {
    		submit();
    	});
    
    	function submit() {
    		
    		// 重置错误信息
    		$error.isFailed = false;
    		$(".error").empty();
    		
    		var $password = $("#password").val();
    		if (!(passwordCheck.test($password))) {
    			$(".error").text("密码长度应在8~16位之间");
    			$error.isFailed = true;
    			return;
    		}
    		
    		if (($("#repasswd").val()) != $password) {
    			$(".error").text("两次输入的密码不一致");
    			$error.isFailed = true;
    			return;
    		}
    		// 发起请求
    		$.ajax({
    			url: "<%=path %>/passport/register/step2/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			data: {"password":$password},
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$(".error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					$error.isFailed = true;
					enable();
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					window.location.href = "<%=path%>/passport/register/step3";
    				} else {
    					if (data.code == Code["PASSWORD_NOT_ACCEPT"]) {
    						$(".error").text("密码长度应在8~16位之间");
    						$error.isFailed = true;
    					} else if (data.code == Code["SERVER_ERROR"]) {
	    					$(".error").text("服务端发生未知错误，请稍后重试");
	    					$error.isFailed = true;
	    				}
    					enable();
    				}
    			}
    		});
    	}
    </script>
</body>
</html>