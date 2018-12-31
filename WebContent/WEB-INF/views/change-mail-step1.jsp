<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script> 
    <style type="text/css">
    	* {
    		margin: 0;
    		padding: 0;
    	}
    	div.outer {
    		width:335px;
    		height: 140px;
    	}
    	div.newmail, div.vercode {
    		width: 100%;
    		height: 35px;
    	}
    	div.vercode {
    		margin-top: 5px;
    	}
    	span.newmail, span.vercode {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 16px;
    		color: #54698D;
    	}
    	input.newmail, input.vercode {
    		height: 25px;
    		border: 1px solid #797979;
    		border-radius: 5px;
    		padding-left: 5px;
    		padding-right: 5px;
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 14px;
    		color: #54698D;
    		outline: none;
    	}
    	input.newmail {
    		width: 250px;
    	}
    	input.vercode {
    		width: 100px;
    	}
    	button.getvercode {
    		width: 100px;
    		height: 27px;
    		border: none;
    		outline: none;
    		border-radius: 5px;
    		background-color: #FD3B12;
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 12px;
    		color: #FFFFFF;
    		cursor: pointer;
    		margin-left: 45px;
    	}
    	div.submit {
    		width: 100%;
    		height: 35px;
    		margin-top: 0px;
    		text-align: center;
    	}
    	div.hint {
    		width: 100%;
    		height: 20px;
    	}
    	span.hint {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 12px;
    		color: #FF0000;
    	}
    	button.submit {
    		width: 300px;
    		height: 35px;
    		border: none;
    		outline: none;
    		border-radius: 5px;
    		margin-top: 10px;
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 14px;
    		color: #FFFFFF;
    		background-color: #1296DB;
    		cursor: pointer;
    	}
    </style>
    
    <style type="text/css">
    	div.success {
    		width: 335px;
    		margin-top: 10px;
    		text-align: center;
    		display: none;
    	}
    	div.image, img.image {
    		height: 80px;
    	}
    	div.image {
    		width: 100%;
    	}
    	img.image {
    		width: 80px;
    	}
    	div.text {
    		width: 100%;
    		margin-top: 20px;
    	}
    	span.text {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 18px;
    		color: #4CAF50;
    	}
    </style>

</head>
<body>
    <div class="outer" id="write">
    	<div class="newmail" id="newmail">
    		<span class="newmail">新邮箱：</span>
    		<input type="text" class="newmail" id="mail">
    	</div>
    	<div class="vercode" id="vercode">
    		<span class="vercode">验证码：</span>
    		<input type="text" class="vercode" id="vercode">
    		<button class="getvercode" id="getvercode">获取验证码</button>
    	</div>
    	<div class="submit">
    		<div class="hint"><span class="hint" id="error"></span></div>
    		<button class="submit" id="submit">提交</button>
    	</div>
    </div>
    
    <div class="success" id="success">
		<div class="image">
			<img class="image" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTQyMDM1NTQwNzg1IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjE4NjUiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNNTEyIDUxMm0tNDQ4IDBhNDQ4IDQ0OCAwIDEgMCA4OTYgMCA0NDggNDQ4IDAgMSAwLTg5NiAwWiIgZmlsbD0iIzRDQUY1MCIgcC1pZD0iMTg2NiI+PC9wYXRoPjxwYXRoIGQ9Ik03MzguMTMzMzMzIDMxMS40NjY2NjdMNDQ4IDYwMS42bC0xMTkuNDY2NjY3LTExOS40NjY2NjctNTkuNzMzMzMzIDU5LjczMzMzNCAxNzkuMiAxNzkuMiAzNDkuODY2NjY3LTM0OS44NjY2Njd6IiBmaWxsPSIjQ0NGRjkwIiBwLWlkPSIxODY3Ij48L3BhdGg+PC9zdmc+" />
		</div>
		<div class="text">
			<span class="text">密码已修改，请牢记新密码</span>
		</div>
	</div>
    
    
    
    <!-- 建立按钮的启用与禁用方法 -->
    <script type="text/javascript">
   		function disable() {
   			$("#submit").attr("disabled", "true");
   			$("#submit").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
   			$("#submit").text("正在提交...");
   		}
   		function enable() {
   			$("#submit").removeAttr("disabled");
   			$("#submit").css({"background-color": "#1296DB", "cursor": "pointer"});
   			$("#submit").text("提交");
    	}
   		function disableVercode() {
			$("#getvercode").attr("disabled", "true");
			$("#getvercode").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
			$("#getvercode").text("正在获取...");
		}
		function enableVercode() {
			$("#getvercode").removeAttr("disabled");
			$("#getvercode").css({"background-color": "#FD3B12", "cursor": "pointer"});
			$("#getvercode").text("获取验证码");
		}
    </script>
    
    <script type="text/javascript">
	    $("#getvercode").click(function() {
	    	// 重置错误信息
			$("#error").empty();
	    	
	    	var $mail = $("#mail").val();
    		if (!(accountCheck.test($mail))) {
    			$("#error").text("邮箱只能使用数字、字母和下划线");
    			return;
    		}
			
			disableVercode();
			
			// 向后台申请验证码
			$.ajax({
				url: "<%=path%>/security/change-mail/vercode/",
				data: {"mail":$mail},
				type: "POST",
				timeout: 5000,
				async: true,
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					enableVercode();
				},
				success: function(data, textStatus) {
					if (data.code == Code["OK"]) {
						// 如果服务端正常生成验证码
						// 则进入倒计时
						var $_time = 60;
						$("#getvercode").text("重新获取(" + $_time + ")");
						var $interval = setInterval(function() {
							if ($_time <= 0) {
								// 清除计时器
								clearInterval($interval);
								$interval = null;
								// 启用按钮
								enableVercode();
							} else {
								// 设置文字
								$_time -- ;
								$("#getvercode").text("重新获取(" + $_time + ")");
							}
						}, 1000);
					} else {
						// 如果出现异常
						if (data.code == Code["ACCOUNT_EMPTY"]) {
							$("#error").text("无法获取验证码，请填写邮箱地址");
						} else if (data.code == Code["ACCOUNT_ALREADY_EXISTS"]) {
							$("#error").text("该邮箱已被注册，请更换其他邮箱");
						} else if (data.code == Code["ACCOUNT_NOT_ACCEPT"]) {
							$("#error").text("邮箱只能使用数字、字母和下划线");
						} else if (data.code == Code["NOT_LOGIN"]) {
    						$("#error").text("身份已过期，请重新登录");
    					} else if (data.code == Code["SERVER_ERROR"]) {
							$("#error").text("服务端发生未知错误，请稍后重试");
						}
						enableVercode();
					}
				}
			});
		});
    </script>
    
    <!-- 绑定提交事件 -->
    <script type="text/javascript">
    	
    	$("#submit").click(function() {
    		submit();
    	});
    
    	function submit() {
    		
    		// 重置错误信息
    		$("#error").empty();
    		var $vercode = $("input#vercode").val();
    		if (!(/^[0-9]{6}$/.test($vercode))) {
    			$("#error").text("验证码格式不正确");
    			return;
    		}
    		
    		var $mail = $("#mail").val();
    		if (!(/^[0-9A-Za-z][\.-_0-9A-Za-z]*@[0-9A-Za-z]+(\.[0-9A-Za-z]+)+$/.test($mail))) {
    			$("#error").text("邮箱只能使用数字、字母和下划线");
    			return;
    		}
    		
    		// 发起请求
    		$.ajax({
    			url: "<%=path%>/security/change-mail/step1/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			data: {"vercode":$vercode,"mail":$mail},
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					enable();
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					$("#write").css("display", "none");
    					$("#success").css("display", "block");
    				} else {
    					if (data.code == Code["VERCODE_EMPTY"]) {
    						$("#error").text("请填写验证码");
    					} else if (data.code == Code["VERCODE_NOT_ACCEPT"]) {
    						$("#error").text("验证码格式不正确");
    					} else if (data.code == Code["VERCODE_WRONG"]) {
    						$("#error").text("验证码错误，请仔细核对邮件中附带的验证码");
    					} else if (data.code == Code["ACCOUNT_NOT_ACCEPT"]) {
	    					$("#error").text("邮箱已被更改，请重新获取验证码");
	    				} else if (data.code == Code["ACCOUNT_EMPTY"]) {
							$("#error").text("请填写邮箱地址");
						} else if (data.code == Code["NOT_LOGIN"]) {
    						$("#error").text("身份已过期，请重新登录");
    					} else if (data.code == Code["SERVER_ERROR"]) {
	    					$("#error").text("服务端发生未知错误，请稍后重试");
	    				} 
    					enable();
    				}
    			}
    		});
    		
    	}
    </script>
</body>
</html>