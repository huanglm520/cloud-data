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
    <title>找回密码(第2/3步) - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://static.sunrise-su.net.cn/cloud-data/images/cloud.png" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/public.css" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/passport.css" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/register.css" />
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/vue.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/check.js"></script>
    
    <style type="text/css">
		div.verode {
			width: 150px;
			height: 35px;
			margin-left: 240px;
			margin-top: -32px;
		}
		button.verode {
			width: 110px;
			height: 32px;
			border: none;
			border-radius: 5px;
			background-color: #FD3B12;
			font-family: "微软雅黑", "华文细黑";
			font-size: 12px;
			color: #FFFFFF;
			outline: none;
			cursor: pointer;
		}
	</style>

</head>
<body>
	<div class="topbar">
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="https://static.sunrise-su.net.cn/cloud-data/images/cloud.svg">
			</div>
			<div class="topbarspan">
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化管理平台</span>
			</div>
			<div class="timer">
				<span class="timer" id="timer">正在获取服务器时间</span>
			</div>
			<div class="user">
				<span class="user">找回密码(第2/3步)</span>
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
    		<div class="p_line unused"></div>
    		<a href="<%=path%>/passport/forget-password/step3"><div class="p_number unused">
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
    			<span class="hint">请输入邮件中附带的验证码</span>
    		</div>
    		<div class="inner" style="width: 200px">
    			<input class="inner" type="text" id="vercode" style="width: 200px" />
    			<div class="verode">
    				<button class="verode" id="getvercode">获取验证码</button>
    			</div>
    		</div>

    		<div class="line">
    			<hr />
    		</div>
    		
    		<div class="submit">
    			<button class="submit" id="submit">下一步</button>
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
			
			$("#getvercode").mouseover(function() {
				// 鼠标划过事件
				$("#getvercode").animate({"background-color": "#F86344"}, 200);
			});
			$("#getvercode").mouseout(function() {
				// 鼠标划出事件
				$("#getvercode").animate({"background-color": "#FD3B12"}, 200);
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
    
    <!-- 绑定获取验证码事件 -->
    <script type="text/javascript">
    
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
    
	    $("#getvercode").click(function() {
	    	// 重置错误信息
    		$error.isFailed = false;
    		$(".error").empty();
    		
    		disableVercode();
    		
    		// 向后台申请验证码
    		$.ajax({
    			url: "<%=path %>/passport/forget-password/vercode/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$(".error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					$error.isFailed = true;
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
    						$(".error").text("无法获取账户，请确认第一步信息是否完整");
    						$error.isFailed = true;
    					} else if (data.code == Code["SERVER_ERROR"]) {
    						$(".error").text("服务端发生未知错误，请稍后重试");
	    					$error.isFailed = true;
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
    		$error.isFailed = false;
    		$(".error").empty();
    		
    		var $vercode = $("#vercode").val();
    		if (!(vercodeCheck.test($vercode))) {
    			$(".error").text("验证码格式不正确");
    			$error.isFailed = true;
    			return;
    		}
    		
    		// 发起请求
    		$.ajax({
    			url: "<%=path %>/passport/forget-password/step2/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			data: {"vercode":$vercode},
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				$(".error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					$error.isFailed = true;
					enable();
    			},
    			success: function(data, textStatus) {
    				if (data.code == Code["OK"]) {
    					window.location.href = "<%=path%>/passport/forget-password/step3";
    				} else {
    					if (data.code == Code["VERCODE_EMPTY"]) {
    						$(".error").text("验证码格式不正确");
    						$error.isFailed = true;
    					} else if (data.code == Code["VERCODE_NOT_ACCEPT"]) {
    						$(".error").text("验证码格式不正确");
    						$error.isFailed = true;
    					} else if (data.code == Code["VERCODE_WRONG"]) {
    						$(".error").text("验证码错误，请仔细核对邮件中附带的验证码");
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