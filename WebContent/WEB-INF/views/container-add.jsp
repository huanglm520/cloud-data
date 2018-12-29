<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="cn.net.sunrise.su.beans.passport.UserBean"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%
	UserBean usb = (UserBean)session.getAttribute(AttributeKey.SESSION_ACCOUNT.key);
%>
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
    <title>新建容器 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://static.sunrise-su.net.cn/cloud-data/images/cloud.png" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/public.css" />
    <link rel="stylesheet" href="https://static.sunrise-su.net.cn/cloud-data/scripts/css/toolbar.css" />
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/vue.min.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://static.sunrise-su.net.cn/cloud-data/scripts/js/check.js"></script>

	<style type="text/css">
		div.content {
			width: 400px;
			margin: auto;
			margin-bottom: 70px;
		}
		div.container {
			margin-top: 20px;
		}
		div.containername {
		}
		span.containername {
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			color: #717671;
		}
		div.containerinput {
			width: 100%;
			margin-top: 10px;
		}
		input.containerinput {
			width: 100%;
			height: 30px; 
			border: 1px solid #BDBDBD;
			border-radius: 5px;
			padding-left: 5px;
			padding-right: 5px;
			outline: none;
			font-family: "Consolas";
			font-size: 18px;
			color: #717671;
		}
		div.error {
			width: 100%;
			height: 20px;
			margin-top: 15px;
			text-align: center;
		}
		span.error {
			font-family: "微软雅黑", "华文细黑";
			font-size: 12px;
			color: #FF0000;
		}
		div.submit {
			width: 100%;
			text-align: center;
			margin-top: 20px;
		}
		button.submit {
			width: 150px;
			height: 35px;
			border: none;
			outline: none;
			cursor: pointer;
			border-radius: 5px;
			background-color: #1296DB;
			font-family: "微软雅黑", "华文细黑";
			font-size: 14px;
			color: #FFFFFF;
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
				<span class="user">欢迎你，<%=usb.getLast_name()+usb.getFirst_name() %>&nbsp;/&nbsp;<a href="javascript:void(0);"><span class="user" style="color:#FF0000" id="logout">退出登录</span></a></span>
			</div>
		</div>
	</div>
	
	<div class="navigation">
		<table class="navigation">
			<tr class="navigation">
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/home.svg">
					<span class="navigation">&nbsp;个人主页</span>
					<div class="navigationPointer" id="personalHome"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/container.svg">
					<span class="navigation">&nbsp;容器管理</span>
					<div class="navigationPointer" id="containerManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/account.svg">
					<span class="navigation">&nbsp;账号管理</span>
					<div class="navigationPointer" id="accountManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://static.sunrise-su.net.cn/cloud-data/images/security.svg">
					<span class="navigation">&nbsp;安全中心</span>
					<div class="navigationPointer" id="securityCenter"></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="content">
		<div style="width: 100%;text-align: center;">
			<span style="font-family: '微软雅黑'; font-size: 17px; color: red;">容器创建完成后容器名称和API名称将不可修改<br>请谨慎填写</span>
		</div>
		<div class="container">
			<div class="containername">
				<span class="containername">容器名称</span>
			</div>
			<div class="containerinput">
				<input type="text" class="containerinput" id="containerName" spellcheck="false" />
			</div>
		</div>
		<div class="container">
			<div class="containername">
				<span class="containername">API名称</span>
			</div>
			<div class="containerinput">
				<input type="text" class="containerinput" id="apiName" spellcheck="false" />
			</div>
		</div>
		<div class="error">
			<span class="error" id="error"></span>
		</div>
		<div class="submit">
			<button class="submit" id="submit">创建容器</button>
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
	
	<script type="text/javascript">
		// 绑定按钮动画
		$("#submit").mouseover(function () {
			$("#submit").animate({"background-color":"#54BBF1"}, 200);
		});
		$("#submit").mouseout(function () {
			$("#submit").animate({"background-color":"#1296DB"}, 200);
		});
		
		// 绑定api名称输入框自动填充事件
		$("#containerName").bind("input", function () {
			var text = $("#containerName").val();
			if (text == "") {
				$("#apiName").val("");
			} else {
				$("#apiName").val(text+"_cd");
			}
		});
	</script>
	
	<script type="text/javascript">
		// 设置按钮启用与禁用
		function disable() {
			$("#submit").css({"background-color":"#8B8F93", "cursor":"not-allow"});
			$("#submit").text("正在提交...");
			$("#submit").attr("disabled", "true");
		}
		function enable() {
			$("#submit").css({"background-color":"#1296DB", "cursor":"pointer"});
			$("#submit").text("创建容器");
			$("#submit").removeAttr("disabled");
		}
	</script>
	
	<script type="text/javascript">
		// 提交事件
		$("#submit").click(function () {
			
			$("#error").empty();
			
			var containerName = $("#containerName").val();
			if (containerName == "") {
				// error empty
				$("#error").text("容器名称不能为空");
				return;
			}
			if (containerName.length > 16) {
				$("#error").text("容器名称长度不能超过16");
				return;
			}
			if (!(containerNameCheck.test(containerName))) {
				// error not accept
				$("#error").text("容器名称只能使用字母，数字和下划线，并且不能以数字开头");
				return;
			}
			
			var apiName = $("#apiName").val();
			if (apiName == "") {
				$("#error").text("API名称不能为空");
				return;
			}
			if (apiName.length > 32) {
				$("#error").text("API名称长度不能超过32");
				return;
			}
			if (!(containerApiCheck.test(apiName))) {
				$("#error").text("API名称只能使用字母，数字和下划线，并且不能以数字开头");
				return;
			}
			
			disable();
			
			// 进行ajax请求
			$.ajax({
				url: "<%=path%>/container/add/",
				data: {"containerName":containerName, "apiName":apiName},
				type: "POST",
				timeout: 5000,
				async: true,
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					enable();
				},
				success: function(data, textStatus) {
					if (data.code == Code["OK"]) {
						window.location.href = "<%=path%>/container/manager/main?cid="+data.cid;
					} else {
						if (data.code == Code["CONTAINER_NAME_EMPTY"]) {
							$("#error").text("容器名称不能为空");
						} else if (data.code == Code["CONTAINER_NAME_TOO_LONG"]) {
							$("#error").text("容器名称长度不能超过16");
						} else if (data.code == Code["CONTAINER_NAME_NOT_ACCEPT"]) {
							$("#error").text("容器名称只能使用字母，数字和下划线，并且不能以数字开头");
						} else if (data.code == Code["CONTAINER_NAME_ALREADY_EXISTS"]) {
							$("#error").text("容器名称已存在，请更换其他名称");
						} else if (data.code == Code["API_NAME_EMPTY"]) {
							$("#error").text("API名称不能为空");
						} else if (data.code == Code["API_NAME_TOO_LONG"]) {
							$("#error").text("API名称长度不能超过32");
						} else if (data.code == Code["API_NAME_NOT_ACCEPT"]) {
							$("#error").text("API名称只能使用字母，数字和下划线，并且不能以数字开头");
						} else if (data.code == Code["API_NAME_ALREADY_EXISTS"]) {
							$("#error").text("API名称已存在，请更换其他名称");
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