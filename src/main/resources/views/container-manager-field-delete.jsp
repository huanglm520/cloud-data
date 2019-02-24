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
    <title>删除容器 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/jquery-ui.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>

	<style type="text/css">
		div.content {
			width: 100%;
		}
		div.warning {
			width: 100%;
			text-align: center;
		}
		span.warning {
			font-family: "微软雅黑", "华文细黑";
			font-size: 24px;
			font-weight: 600;
			color: #FF0000;
		}
		div.hint {
			width: 100%;
			text-align: center;
			margin-top: 10px;
		}
		span.hint {
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			font-weight: 600;
			color: #6B716B;
		}
		div.name {
			width: 400px;
			margin: auto;
			margin-top: 15px; 
		}
		input.name {
			width: 400px;
			height: 30px;
			border: 1px solid #797979;
			border-radius: 5px;
			outline: none;
			text-align: center;
			padding-left: 5px;
			padding-right: 5px;
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			font-weight: 600;
			color: #6B716B;
		}
		div.submit {
			width: 100%;
			margin-top: 40px;
			margin-bottom: 70px;
			text-align: center;
		}
		button.submit {
			width: 200px;
			height: 35px;
			border: none;
			outline: none;
			border-radius: 5px;
			background-color: #FF0000;
			font-family: "微软雅黑", "华文细黑";
			font-size: 13px;
			color: #FFFFFF;
			cursor: pointer;
		}
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

	<div class="quarantine" id="quarantine"></div>
	<div id="pop"></div>

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
		<div class="warning">
			<span class="warning">警告：此操作具有高度危险性</span>
		</div>
		<div class="hint">
			<span class="hint">该操作会删除与该字段关联的所有数据，且无法恢复，请三思而后行。<br>若要删除此字段，请在下方输入字符串：<span style="color: #FF0000"><%=request.getAttribute(SecurityKey.DROP_FIELD.key) %></span>，然后单击删除</span>
		</div>
		<div class="name">
			<input class="name" id="name" type="text" placeholder="请在此输入字符串" spellcheck="false" />
		</div>
		<div class="submit">
			<button class="submit" id="submit" onmouseover="$(this).animate({'background-color':'#F45454'}, 200);" onmouseout="$(this).animate({'background-color':'#FF0000'}, 200);">删除字段</button>
		</div>
	</div>
	
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	    
	</div>
	
	<script type="text/javascript">
		function disable() {
			$("#submit").css({"background-color":"#8B8F93", "cursor":"not-allow"});
			$("#submit").text("正在删除...");
			$("#submit").attr("disabled", "true");
		}
		function enable() {
			$("#submit").css({"background-color":"#FF0000", "cursor":"pointer"});
			$("#submit").text("删除字段");
			$("#submit").removeAttr("disabled");
		}
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
		
		$("#submit").click(function() {
			
			disable();
			
			var name = $("#name").val();
			if (name != "<%=request.getAttribute(SecurityKey.DROP_FIELD.key) %>") {
				$("#quarantine").css({"display": "block"});
				$("#pop").empty();
				$("#pop").append("字符串不正确");
				$("#pop").dialog({
					height: 200,
					width: 300,
					model: true,
					draggable: false,
					buttons: {
						"确定": function() {
							$(this).dialog("close");
							$("#quarantine").css("display", "none");
							$("#pop").empty();
							$("#ui-id-1").empty();
							enable();
						}
					},
					open: function(event, ui) {
						$(".ui-dialog-titlebar-close", $(this).parent()).hide();
						$("#ui-id-1").text("错误");
					}
				});
				return;
			}
			
			$.ajax({
				url: "<%=path%>/container/manager/field/delete/",
				type: "POST",
				timeout: 5000,
				async: true,
				data: {"name":name, "fid":fid},
				dataType: "json",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					$("#quarantine").css({"display": "block"});
					$("#pop").empty();
					$("#pop").append("连接到服务器时出现问题");
					$("#pop").dialog({
						height: 200,
						width: 300,
						model: true,
						draggable: false,
						buttons: {
							"确定": function() {
								$(this).dialog("close");
								$("#quarantine").css("display", "none");
								$("#pop").empty();
								$("#ui-id-1").empty();
								enable();
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text("错误");
						}
					});
				},
				success: function(data, textStatus) {
					$("#quarantine").css({"display": "block"});
					$("#pop").empty();
					if (data.code == Code["OK"]) {
						$("#pop").append("字段已删除");
					} else if (data.code == Code["NOT_LOGIN"]) {
						$("#pop").append("身份已过期，请重新登录");
					} else if (data.code == Code["NO_PRIVILEGE"]) {
						$("#pop").append("当前用户没有权限执行此操作");
					} else {
						$("#pop").append("服务器端未知错误");
					}
					$("#pop").dialog({
						height: 200,
						width: 300,
						model: true,
						draggable: false,
						buttons: {
							"确定": function() {
								$(this).dialog("close");
								$("#quarantine").css("display", "none");
								$("#pop").empty();
								$("#ui-id-1").empty();
								if (data.code == Code["OK"]) {
									window.location.href = "<%=path%>/container/manager/field?cid="+cid;
								}
								enable();
							}
						},
						open: function(event, ui) {
							$(".ui-dialog-titlebar-close", $(this).parent()).hide();
							$("#ui-id-1").text(data.code == Code["OK"] ? "请求已完成" : "请求失败");
						}
					});
				}
			});
		});
	</script>
	
</body>
</html>