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
    <title>Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="<%=path %>/resources/images/cloud.png" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/public.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/passport.css" />
    <link rel="stylesheet" href="<%=path %>/resources/scripts/css/toolbar.css" />
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/vue.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/code.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/scripts/js/timer.js"></script>
    
</head>
<body>
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
				<span class="user">用户登录</span>
			</div>
		</div>
	</div>
    <div class="passport" style="background-color: rgba(0,0,0,0)">
    	<div class="info" style="box-shadow: 0 0 100px #9FA89F;">
    	
    		<div style="width: 400px; margin-top: 20px; text-align: center;" id="error">
    			<span class="error" v-show="isFailed"></span>
    		</div>
    	
    		<div class="hint">
    			<span class="hint">邮箱</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="text" id="account" />
    		</div>
    		
    		<div class="hint">
    			<span class="hint">密码</span>
    		</div>
    		<div class="inner">
    			<input class="inner" type="password" id="password" />
    		</div>
    		
    		<div class="submit">
    			<button class="submit" id="submit">登录</button>
    		</div>
    		
    		<!-- 绘制分割线 -->
    		<div class="line">
    			<hr/>
    		</div>
    		
    		<!-- 绘制底部链接 -->
    		<div class="bottom">
    			<div class="b_left">
    				<a href="<%=path%>/passport/register"><span class="bottom">新用户注册</span></a>
    			</div>
    			<div class="b_right">
    				<a href="<%=path%>/passport/forget-password"><span class="bottom">找回密码</span></a>
    			</div>
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
    
    <!-- 对按钮进行动画渲染 -->
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
    		
    		// 移除qqmap插件
    		$("#qqmap").remove();
    	});
    </script>
    
    <!-- 建立按钮的启用与禁用方法 -->
    <script type="text/javascript">
   		function disable() {
   			$("#submit").attr("disabled", "true");
   			$("#submit").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
   			$("#submit").text("正在登录...");
   		}
   		function enable() {
   			$("#submit").removeAttr("disabled");
   			$("#submit").css({"background-color": "#0070D2", "cursor": "pointer"});
   			$("#submit").text("登录");
    	}
    </script>
    
    <!-- 绑定提交事件 -->
    <script type="text/javascript">
    	
    	var $address = null;
    	var $position = null;
    	function callback(json) {
    		$address = json.result.ip;
    		$position = json.result.ad_info.province+" "+json.result.ad_info.city+" "+json.result.ad_info.district;
    	}
    
    	$("#submit").click(function() {
    		submit();
    	});
    
    	function submit() {
    		
    		$(".error").empty();
    		$error.isFailed = false;
    		
    		var $account = $("#account").val();
    		if ($account == '') {
    			$(".error").text("请输入账户邮箱");
    			$error.isFailed = true;
    			return;
    		}
    		
    		var $password = $("#password").val();
    		if ($password == '') {
    			$(".error").text("请输入密码");
    			$error.isFailed = true;
    			return;
    		}
    		
    		disable();
    		
    		// 获取位置信息
    		// 此处加载腾讯位置api服务
    		var JSONP = document.createElement('script');
			JSONP.type = 'text/javascript';
			JSONP.src = "https://apis.map.qq.com/ws/location/v1/ip?key=6F6BZ-YVR36-BP3SS-E2ONB-2AN35-Q5FHT&output=jsonp&callback=callback";
			JSONP.id = "qqmap";
			document.getElementsByTagName("head")[0].appendChild(JSONP);

    		// 发起连接请求
    		$.ajax({
    			url: "<%=path %>/passport/login/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
    			data: {"account":$account, "password":$password, "address":$address, "position":$position},
    			dataType: "json",
    			error: function(XMLHttpRequest, textStatus, errorThrown) {
    				// Error Process
    				/* if (textStatus == "error") */{
    					$(".error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
    					$error.isFailed = true;
    					enable();
    				}
    			},
    			success: function(data, textStatus) {
					if (data.code == Code["OK"]) {
						window.location.href = "<%=path %>/home";
					} else {
						if (data.code == Code["ACCOUNT_NOT_EXISTS"]) {
							$(".error").text("该邮箱尚未注册，请检查您输入的邮箱是否正确");
							$error.isFailed = true;
						} else if (data.code == Code["PASSWORD_WRONG"]) {
							$(".error").text("密码错误，如果您已经遗忘您的密码，请点击下方链接找回密码");
							$error.isFailed = true;
						} else if (data.code == Code["ACCOUNT_EMPTY"]) {
							$(".error").text("请输入账户邮箱");
							$error.isFailed = true;
						} else if (data.code == Code["PASSWORD_EMPTY"]) {
							$(".error").text("请输入密码");
							$error.isFailed = true;
						} else if (data.code == Code["SERVER_ERROR"]) {
							$(".error").text("服务端发生未知错误，请稍后重试");
							$error.isFailed = true;
						}
						enable();
						$("#qqmap").remove();
					}
    			}
    		});
    	}
    </script>
	
	<!-- 调用腾讯位置api -->   
    <script type="text/javascript" src="https://apis.map.qq.com/ws/location/v1/ip?key=6F6BZ-YVR36-BP3SS-E2ONB-2AN35-Q5FHT&output=jsonp&callback=callback" id="qqmap"></script>
   
</body>
</html>