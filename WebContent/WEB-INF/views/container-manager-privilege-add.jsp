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
    <title>添加权限 - Cloud-Data 数据一体化管理平台</title>
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
		div.title {
			width: 100%;
			text-align: center;
		}
		span.title {
			font-family: "微软雅黑", "华文细黑";
			font-size: 22px;
			font-weight: 600;
			color: #727672;
		}
		div.account {
			width: 100%;
			text-align: center;
			margin-top: 15px;
		}
		input.account {
			width: 300px;
			height: 30px;
			text-align: center;
			font-family: "微软雅黑", "华文细黑";
			font-size: 15px; 
			color: #727672;
			border: 1px solid #797979;
			outline: none;
			border-radius: 5px;
		}
		div.result {
			width: 100%;
			text-align: center;
			margin-top: 10px;
		}
		span.result {
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			font-weight: 600;
			color: #727672;
		}
		select.result {
			width: 100px;
			height: 25px;
			border: 1px solid #797979;
			outline: none;
			border-radius: 5px;
			padding-left: 5px;
		}
		div.error {
			width: 100%;
			text-align: center;
			margin-top: 10px;
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
			width: 200px;
			height: 30px;
			border: none;
			outline: none;
			border-radius: 5px;
			background-color: #1296DB;
			font-family: "微软雅黑", "华文细黑";
			font-size: 12px;
			color: #FFFFFF;
			cursor: pointer;
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
	
	<div class="content" id="content">
		<div class="title">
			<span class="title">请在下方输入需要添加权限的用户账户</span>
		</div>
		<div class="account">
			<input type="text" id="account" class="account" placeholder="请在此处输入用户账户" spellcheck="false" />
		</div>
		<div class="result" v-show="v_result">
			<span class="result" v-if="s_success">已搜索到用户，请<span style="color:#1296DB;cursor: pointer;" id="view_user">单击此处</span>查看用户详细信息</span>
			<span class="result" v-else>未搜索到该用户，请检查用户账户是否正确</span>
			<div style="margin-top: 5px" v-show="s_success">
				<span class="result">请选择给该账户添加的权限：</span>
				<select class="result" id="privilege">
					<option value="admin">ADMIN</option>
					<option value="guest">GUEST</option>
				</select>
			</div>
		</div>
		<div class="error" v-show="error">
			<span class="error" id="error">连接到服务器时出现错误</span>
		</div>
		<div class="submit">
			<button class="submit" id="submit"  onmouseover="$(this).animate({'background-color':'#46B4EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);">搜索用户</button>
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
		var vueObj = new Vue({
			el: "#content",
			data: {
				v_result: false,
				s_success: false,
				error: false,
			}
		});
		
		var param = window.location.search;
		var cid = -1;
		if (param.indexOf("?") != -1) {
			var arr = param.substr(1).split("&");
			for (var i=0; i<arr.length; i++) { 
				var t = arr[i].split("=");
				if (t[0] == "cid") {
					cid = t[1];
				}
			}
		}
		var uid = null;
		
		var step = 0;
		
		function disable(str) {
   			$("#submit").attr("disabled", "true");
   			$("#submit").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
   			$("#submit").text(str);
   		}
   		function enable(str) {
   			$("#submit").removeAttr("disabled");
   			$("#submit").css({"background-color": "#0070D2", "cursor": "pointer"});
   			$("#submit").text(str);
    	}
   		
	</script>
	
	<script type="text/javascript">
		$("#submit").click(function() {
			
			vueObj.error = false;
			$("#error").empty();
			
			if (step == 0) {
				var account = $("#account").val();
				if (account.length == 0) {
					$("#error").text("请输入用户账户");
					vueObj.error = true;
					return;
				}
				disable("正在搜索...");
				$.ajax({
					url: "<%=path%>/container/manager/privilege/add/search-user/", // Write request url
					type: "POST",
					timeout: 5000,
					async: true,
					data: {"account":account},
					dataType: "json",
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
						vueObj.error = true;
						enable("搜索用户");
					},
					success: function(data, textStatus) {
						vueObj.v_result = true;
						if (data.code == Code["OK"]) {
							vueObj.s_success = true;
							$("#view_user").click(function() {
								window.open("<%=path %>/account/view?uid="+data.obj.id);
							});
							enable("添加权限");
							step++;
						} else {
							if (data.code == Code["NOT_LOGIN"]) {
								// 身份过期
								window.location.reload();
							} 
							vueObj.s_success = false;
							$("#view_user").unbind("click");
							enable("搜索用户");
						}
					}
				});
			}
		});
	</script>
	
</body>
</html>