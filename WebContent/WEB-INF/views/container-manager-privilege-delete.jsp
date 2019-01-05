<%@page import="cn.net.sunrise.su.enums.SecurityKey"%>
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
    <title>删除权限 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>

	<style type="text/css">
		div.content {
			width: 100%;
			margin-bottom: 70px;
		}
		div.hint {
			width: 100%;
			text-align: center;
		}
		span.hint {
			font-family: "微软雅黑", "华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #777977;
		}
		div.data {
			width: 550px;
			margin: auto;
			margin-top: 20px;
		}
		table.data {
			border-collapse: collapse;  
			border-spacing: 0;
		}
		table.data, td.l_data, td.r_data {
			border: 1px solid #767976;
		}
		tr.data {
			height: 40px;
		}
		td.l_data, td.r_data {
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			color: #777977;
			font-weight: 600;
		}
		td.l_data {
			width: 100px;
		}
		td.r_data {
			width: 440px;
		}
		button.submit {
			width: 100%;
			height: 40px;
			border: none;
			outline: none;
			background-color: #FF0000;
			font-family: "微软雅黑", "华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #FFFFFF;
			cursor: pointer;
		}
		div.error {
			width: 100%;
			margin-top: 20px;
			text-align: center;
		}
		span.error {
			font-family: "微软雅黑", "华文细黑";
			font-size: 14px;
			color: #FF0000;
		}
	</style>

</head>
<body>
	<div class="topbar"> 
		<div class="topbarinner">
			<div>
				<img class="topbarimg" src="https://huanglm520.github.io/cloud-data.static.io/images/cloud.svg">
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
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/home.svg">
					<span class="navigation">&nbsp;个人主页</span>
					<div class="navigationPointer" id="personalHome"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/container.svg">
					<span class="navigation">&nbsp;容器管理</span>
					<div class="navigationPointer" id="containerManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/account.svg">
					<span class="navigation">&nbsp;账号管理</span>
					<div class="navigationPointer" id="accountManager"></div>
				</td>
				<td class="navigation">
					<img class="navigation" src="https://huanglm520.github.io/cloud-data.static.io/images/security.svg">
					<span class="navigation">&nbsp;安全中心</span>
					<div class="navigationPointer" id="securityCenter"></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="content">
		<div class="hint">
			<span class="hint">请确认以下信息后点击&nbsp;删除权限&nbsp;按钮来删除该条目</span>
		</div>
		<div class="data">
			<table class="data">
				<tr class="data">
					<td class="l_data">账号：</td>
					<td class="r_data"><%=request.getAttribute(SecurityKey.USER_ACCOUNT.key) %></td>
				</tr>
				<tr class="data">
					<td class="l_data">容器：</td>
					<td class="r_data"><%=request.getAttribute(SecurityKey.CONTAINER_NAME.key) %></td>
				</tr>
				<tr class="data">
					<td class="l_data">权限：</td>
					<td class="r_data"><%=request.getAttribute(SecurityKey.PRIVILEGE_NAME.key) %></td>
				</tr>
			</table>
			<button class="submit" id="submit" onmouseover="$(this).animate({'background-color':'#F45454'}, 200);" onmouseout="$(this).animate({'background-color':'#FF0000'}, 200);">×删除权限</button>
		</div>
		<div class="error">
			<span class="error" id="error"></span>
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
		var param = window.location.search;
		var pid = -1;
		var cid = -1;
		if (param.indexOf("?") != -1) {
			var arr = param.substr(1).split("&");
			for (var i=0; i<arr.length; i++) { 
				var t = arr[i].split("=");
				if (t[0] == "pid") {
					pid = t[1];
				} else if (t[0] == "cid") {
					cid = t[1];
				}
			}
		}
	</script>
	
	<script type="text/javascript">
		$("#submit").click(function() {
			$("#error").empty();
			
			$.ajax({
				url: "<%=path%>/container/manager/privilege/delete/", // Write request url
				type: "POST",
				timeout: 5000,
				async: true,
				data: {"pid":pid},
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
				},
				success: function(data, textStatus) {
					if (data.code == Code["OK"]) {
						window.location.href = "<%=path %>/container/manager/privilege?cid=" + cid;
					} else {
						if (data.code == Code["NOT_LOGIN"]) {
							// 身份过期
							window.location.reload();
						} else {
							$("#error").text("删除失败，请稍后重试");
						}
					}
				}
			});
		});
	</script>
	
</body>
</html>