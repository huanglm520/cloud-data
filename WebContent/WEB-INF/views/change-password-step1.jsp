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
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/vue.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/check.js"></script>    
    <style type="text/css">
    	* {
    		margin: 0;
    		padding: 0;
    	}
    	div.outer {
    		width: 360px;
    	}
    	div.inputer {
    		width: 360px;
    		margin-bottom: 15px;
    	}
    	span.inputer {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 18px;
    		color: #818A81;
    	}
    	input.inputer {
    		width: 200px;
    		height: 25px;
    		padding-left: 5px;
    		padding-right: 5px;
    		border-radius: 5px;
    		border: 1px solid #99A89A;
    		outline: none;
    		font-size: 16px;
    		color: #818A81;
    	}
    	div.hint {
    		width: 100%;
    		height: 20px;
    		margin-bottom: 15px;
    		text-align: center;
    	}
    	span.hint {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 12px;
    		color: red;
    	}
    	div.buttons {
    		margin-left: 75px;
    	}
    	button.reset, button.submit {
    		width: 80px;
    		height: 30px;
    		border: none;
    		outline: none;
    		cursor: pointer;
    		border-radius: 5px;
    	}
    	button.reset {
    		background-color: #BFCDD4;
    		color: #000000;
    	}
    	button.submit {
    		background-color: #1296DB;
    		color: #FFFFFF;
    		margin-left: 50px;
    	}
    </style>
    
    <style type="text/css">
    	div.success {
    		width: 360px;
    		margin-top: 45px;
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
		<div class="inputer">
			<span class="inputer">请输入旧密码：</span><input type="password" class="inputer" id="oldPass" />
		</div>
		<div class="inputer">
			<span class="inputer">请输入新密码：</span><input type="password" class="inputer" id="newPass" />
		</div>
		<div class="inputer">
			<span class="inputer">再输一次新密码：</span><input type="password" class="inputer" id="reNewPass" style="width: 183px;" />
		</div>
		<div class="hint">
			<span class="hint" id="error"></span>
		</div>
		<div class="buttons">
			<button id="reset" class="reset">重置</button>
			<button id="submit" class="submit">提交</button>
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
	
	<script type="text/javascript">
		$("#reset").click(function() {
			$("#oldPass").val('');
			$("#newPass").val('');
			$("#reNewPass").val('');
			$("#hint").empty();
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
   			$("#submit").css({"background-color": "#1296DB", "cursor": "pointer"});
   			$("#submit").text("提交");
    	}
    </script>
	
	<script type="text/javascript">
		$("#submit").click(function() {
			// 检查数据
			var $oldPass = $("#oldPass").val();
			
			var $newPass = $("#newPass").val();
			if (!(passwordCheck.test($newPass))) {
				$("#error").text("密码长度应在8~16位之间");
				return;
			}
			
			if ($newPass != $("#reNewPass").val()) {
				$("#error").text("两次输入的密码不一致");
				return;
			}
			
			disable();
			
			// 发起请求
			$.ajax({
				url: "<%=path%>/security/change-password/step1/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			data: {"oldpass":$oldPass,"newpass":$newPass},
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$(".error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					$error.isFailed = true;
					enable();
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					$("#write").css("display", "none");
    					$("#success").css("display", "block");
    				} else {
    					if (data.code == Code["PASSWORD_EMPTY"]) {
    						$("#error").text("密码不能为空");
    					} else if (data.code == Code["PASSWORD_WRONG"]) {
    						$("#error").text("旧密码不正确");
    					} else if (data.code == Code["PASSWORD_NOT_ACCEPT"]) {
    						$("#error").text("密码长度应在8~16位之间");
    					} else if (data.code == Code["NOT_LOGIN"]) {
    						$("#error").text("身份已过期，请重新登录");
    					} else if (data.code == Code["SERVER_ERROR"]) {
	    					$("#error").text("服务端发生未知错误，请稍后重试");
	    				} 
    					enable();
    				}
    			}
			});
		});
	</script>
	
</body>
</html>