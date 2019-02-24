<%@page import="cn.net.sunrise.su.enums.SecurityKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="cn.net.sunrise.su.beans.UserBean"%>
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
    <title>添加容器字段 - Cloud-Data 数据一体化管理平台</title>
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
		div.c_name {
			width: 100%;
			text-align: center;
		}
		span.c_name {
			font-family: "微软雅黑","华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #7B7C78;
		}
		div.data {
			width: 400px;
			margin: auto;
			margin-top: 30px;
			border-bottom: 1px solid #797979;
			padding-bottom: 5px; 
		}
		span.data {
			font-family: "微软雅黑","华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #7B7C78;
		}
		input.data, select.data {
			font-family: "微软雅黑","华文细黑";
			font-size: 17px;
			color: #7B7C78;
			width: 280px;
			text-align: center;
			text-align-last: center;
			border: none;
			outline: none;
			background-color: rgba(0,0,0,0);
		}
		select.data, option {
			text-align-last: center;
		}
		button.submit {
			width: 200px;
			height: 35px;
			border: none;
			outline: none;
			background-color: #1296DB;
			font-family: "微软雅黑", "华文细黑";
			font-size: 13px;
			color: #FFFFFF; 
			cursor: pointer;
			border-radius: 5px;
		}
		span.error {
			font-family: "微软雅黑", "华文细黑";
			font-size: 12px;
			color:#FF0000;
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
		<div class="c_name">
			<span class="c_name">容器：<%=request.getAttribute(SecurityKey.CONTAINER_NAME.key) %>&nbsp;修改字段</span>
		</div>
		<div class="data">
			<span class="data">字段名称：</span><input type="text" class="data" id="fieldname" spellcheck="false" />
		</div>
		<div class="data">
			<span class="data">字段类型：</span>
			<select class="data" id="fieldtype"> 
				<option value="1">BIT</option>
				<option value="2">INT</option>
				<option value="3">BIGINT</option>
				<option value="4">FLOAT</option>
				<option value="5">DOUBLE</option>
				<option value="6">DECIMAL</option>
				<option value="7">CHAR</option>
				<option value="8" selected="selected">VARCHAR</option>
				<option value="9">LONGTEXT</option>
			</select>
		</div>
		<div class="data" id="len">
			<span class="data">字段长度：</span><input type="text" class="data" id="fieldlen" spellcheck="false" value="255" />
		</div>
		<div class="data">
			<span class="data">是否允许空：</span>
			<select class="data" id="allownull" style="width: 250px;">
				<option value="0">NO</option>
				<option value="1" selected="selected">YES</option>
			</select>
		</div>
		<div class="data">
			<span class="data">字段约束：</span>
			<select class="data" id="fieldkey">
				<option value="0">PRI</option>
				<option value="1">URI</option>
				<option value="2" selected="selected">NOT KEY</option>
			</select>
		</div>
		<div class="data">
			<span class="data">字段默认值：</span><input type="text" class="data" id="fielddefault" spellcheck="false" />
		</div>
		<div class="data" style="border: none; text-align: center; height: 20px">
			<span id="error" class="error"></span>
		</div>
		<div class="data" style="border: none; text-align: center;">
			<button class="submit" id="submit" onmouseover="$(this).animate({'background-color':'#46B4EE'}, 200);" onmouseout="$(this).animate({'background-color':'#1296DB'}, 200);">确认修改</button>
		</div>
	</div>
	
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	   
	</div>
	
	<script type="text/javascript">
		// 由字段类型确定字段长度是否显示
		$("#fieldtype").click(function () {
			var value = $("#fieldtype").val();
			if (value == 7 || value == 8) {
				$("div#len").css({"display": "block"});
				$("#fieldlen").val("255");
			} else {
				$("div#len").css({"display": "none"});
			}
		});
	</script>
	
	<script type="text/javascript">
		
		var json = <%=request.getAttribute(SecurityKey.FIELD_LIST.key) %>;
	
		$(document).ready(function() {
			$("#fieldname").val(json.name);
			var arr = json.type.split("+");
			$("#fieldtype").val(arr[0]);
			if (arr[0]=="7" || arr[0]=="8") {
				$("#fieldlen").val(arr[1]);
			} else {
				$("div#len").css({"display": "none"});
			}
			$("#allownull").val(json.isnull);
			$("#fieldkey").val(json.key);
			$("#fielddefault").val(json.defaultdata == "NULL" ? "" : json.defaultdata);
		});
	</script>
	
	<script type="text/javascript">
		var param = window.location.search;
		var cid = -1;
		var fid = -1;
		if (param.indexOf("?") != -1) {
			var arr = param.substr(1).split("&");
			for (var i=0; i<arr.length; i++) { 
				var t = arr[i].split("=");
				if (t[0] == "cid") {
					cid = t[1];
				} else if (t[0] == "fid") {
					fid = t[1];
				}
			}
		}

		function disable() {
   			$("#submit").attr("disabled", "true");
   			$("#submit").css({"background-color": "#8B8F93", "cursor": "not-allowed"});
   			$("#submit").text("正在修改...");
   		}
   		function enable() {
   			$("#submit").removeAttr("disabled");
   			$("#submit").css({"background-color": "#0070D2", "cursor": "pointer"});
   			$("#submit").text("确认修改");
    	}
   		
	</script>
	
	<script type="text/javascript">
		$("#submit").click(function() {
			$("#error").empty();
			
			var fname = $("#fieldname").val();
			if (!fieldNameCheck.test(fname)) {
				$("#error").text("字段名只允许使用字母和下划线，且长度在16位以内");
				return;
			}
			var len = $("#fieldlen").val();
			if (!(len <= 255)) {
				$("#error").text("字段长度过长，该字段接受的最长长度为255");
				return;
			}
			
			disable();
			
			$.ajax({
				url: "<%=path%>/container/manager/field/modify/", // Write request url
				type: "POST",
				timeout: 5000,
				async: true,
				data: {
					"fieldname": fname,
					"fieldtype": $("#fieldtype").val(),
					"fieldlen": $("#fieldlen").val(),
					"allownull": $("#allownull").val(),
					"fieldkey": $("#fieldkey").val(),
					"defaultdata": $("#fielddefault").val(),
					"fid": fid
				},
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#error").text("连接到服务器时出现问题，请检查您的网络连接或者稍后重试");
					enable();
				},
				success: function(data, textStatus) {
					if (data.code == Code["OK"]) {
						window.location.href = "<%=path %>/container/manager/field?cid="+cid;
					} else {
						if (data.code == Code["NOT_LOGIN"]) {
							// 身份过期
							$("#error").text("身份已过期，请重新登录");
						} else if (data.code == Code["FIELD_NAME_ALREADY_EXISTS"]) {
							$("#error").text("该字段已存在，请更换其名称");
						} else if (data.code == Code["FIELD_NAME_NOT_ACCEPT"] || data.code == Code["FIELD_NAME_EMPTY"]) {
							$("#error").text("字段名只允许使用字母和下划线，且长度在16位以内");
						} else if (data.code == Code["NO_PRIVILEGE"]) {
							$("#error").text("权限不足，修改失败");
						} else if (data.code == Code["FIELD_NOT_EXISTS"]) {
							$("#error").text("字段不存在，修改失败");
						} else if (data.code == Code["SERVER_ERROR"]) {
							$("#error").text("服务器内部错误，请稍后重试");
						}
						enable();
					}
				}
			});
		});
	</script>
	
</body>
</html>