<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    <title>找回密码(第3/3步) - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="<%=path %>/resources/images/cloud.png" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/public.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/passport.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/register.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/jquery-ui.min.css">
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/code.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/timer.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/check.js"></script>
    
    <style type="text/css">
    	div.quarantine {
			width: 100%;
			height: 100%;
			background-color: rgba(142,145,147,0.4);
			position: absolute;
			z-index: 2;
			display: none;
		}
    </style>

</head>
<body>

	<div id="pop" title="密码已更改"></div>
	
	<!-- 添加屏幕隔离层 -->
	<div class="quarantine" id="quarantine"></div>
	
	<div class="topbar">
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="<%=path%>/resources/images/cloud.svg">
			</div>
			<div class="topbarspan">
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化管理平台</span>
			</div>
			<div class="timer">
				<span class="timer" id="timer">正在获取服务器时间</span>
			</div>
			<div class="user">
				<span class="user">找回密码(第3/3步)</span>
			</div>
		</div>
	</div>

    <div class="passport">
    	
    	<!-- 绘制进度条 -->
    	<div class="progress" style="margin-left: 160px">
    		<a href="<%=path%>/passport/forget-password/step1"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">1</span>
    			</div>
    		</div></a>
    		<div class="p_line used"></div>
    		<a href="<%=path%>/passport/forget-password/step2"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">2</span>
    			</div>
    		</div></a>
    		<div class="p_line used"></div>
    		<a href="<%=path%>/passport/forget-password/step3"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">3</span>
    			</div>
    		</div></a>
    	</div>
    	
    	<div class="info">
    	
    		<div style="width: 400px; margin-top: 20px; text-align: center;" id="error">
    			<span class="error" v-show="isFailed"></span>
    		</div>
    		<div class="hint">
    			<span class="hint">请输入新密码</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="password" id="password" />
    		</div>
    		
    		<div class="hint">
    			<span class="hint">请再输入一次密码</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="password" id="repasswd" />
    		</div>

    		<div class="line">
    			<hr />
    		</div>
    		
    		<div class="submit">
    			<button class="submit" id="submit">完成</button>
    		</div>
    		
    	</div>  	
    </div>
    
    <div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=new SimpleDateFormat("yyyy").format(new Date()) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	    <div class="cr_two">
	    	<table>
	    		<tr>
	    			<td style="width: 130px;"><a target="_blank" href="<%=path %>/help/about-us"><span class="linker">关于 Cloud-Data</span></a></td>
	    			<td style="width: 90px;"><a target="_blank" href="<%=path %>/help/feedback"><span class="linker">问题反馈</span></a></td>
	    			<td style="width: 90px;"><a target="_blank" href="<%=path %>/help/about-use"><span class="linker">使用帮助</span></a></td>
	    			<td style="width: 90px;"><a target="_blank" href="<%=path %>/download/driver"><span class="linker">驱动下载</span></a></td>
	    		</tr>
	    	</table>
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
   			$("#submit").text("完成");
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
    		
    		$.ajax({
    			url: "<%=path %>/passport/forget-password/step3/",
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
    					$("#quarantine").css("display", "block");
    					$("#pop").empty();
    					$("#pop").dialog({
    						height: 200,
    						width: 300,
    						model: true,
    						draggable: false,
    						buttons: {
    							"确定": function() {
    								$(this).dialog("close");
    								window.location.href = "<%=path %>/passport/login";
    							}
    						},
    						open: function(event, ui) {
    							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
    						}
    					});
    					$("#pop").append("密码已修改，请牢记新密码");
    				} else {
    					if (data.code == Code["SERVER_ERROR"]) {
    						$(".error").text("服务端发生未知错误，请稍后重试");
    						$error.isFailed = true;
    					} else if (data.code == Code["INCOMPLETE_INFORMATION"]) {
    						$(".error").text("身份验证失败，请重新确认邮箱以及验证码");
    						$error.isFailed = true;
    					} else if (data.code == Code["PASSWORD_EMPTY"]) {
    						$(".error").text("输入的密码为空");
    						$error.isFailed = true;
    					} else if (data.code == Code["PASSWORD_NOT_ACCEPT"]) {
    						$(".error").text("密码格式不正确");
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