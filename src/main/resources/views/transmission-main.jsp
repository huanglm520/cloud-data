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
    <title>数据管理主页 - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/codemirror-5.43.0/lib/codemirror.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/codemirror-5.43.0/lib/codemirror.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/codemirror-5.43.0/mode/sql/sql.js"></script>

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
			font-size: 24px;
			font-weight: 600;
			color: #6F726F;
		}
		div.recordlink {
			width: 100%;
			text-align: center;
		}
		span.recordlink {
			font-family: "微软雅黑", "华文细黑";
			font-size: 20px;
			font-weight: 600;
			color: #1296DB;
			cursor: pointer;
		}
		
		.CodeMirror {
		    line-height: 1.3em;
		    font-family: monospace;
		 
		    /* Necessary so the scrollbar can be absolutely positioned within the wrapper on Lion. */
			position: relative;
			/* This prevents unwanted scrollbars from showing up on the body and wrapper in IE. */
			overflow: hidden;
			background-color: white;
 			width: 100%; 
 			font-family: "Consolas";
 			font-size: 18px;
			
 			height:100px;
			margin-bottom: 9px;
			color: #555555;
			border: 1px solid #ccc;
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
			-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
			-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
			-webkit-transition: border linear 0.2s, box-shadow linear 0.2s;
			-moz-transition: border linear 0.2s, box-shadow linear 0.2s;
			-ms-transition: border linear 0.2s, box-shadow linear 0.2s;
			-o-transition: border linear 0.2s, box-shadow linear 0.2s;
			transition: border linear 0.2s, box-shadow linear 0.2s;  
		}
		 
		.CodeMirror-focused {
		    /* Copied from Bootstrap's textarea */
			border-color: rgba(82, 168, 236, 0.8);
			outline: 0;
			outline: thin dotted \9;
			/* IE6-9 */
		 
		    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
		    -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
		    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);  
		}
		div.editor_control{
			width: 600px;
			margin: auto;
		}
		
		div.ct {
			width: 100%;
			text-align: center;
			margin-top: 10px;
			margin-bottom: 10px;
			font-family: "微软雅黑", "华文细黑";
			font-size: 18px;
			font-weight: 600;
			color: #6F726F;
		}
		
		div.reset, div.query {
			width: 80px;
		}
		
		div.reset {
			margin-top: -8px;
		}
		
		div.query {
			margin-top: 2px;
		}
		
		button.reset, button.query {
			width: 80px;
			height: 50px;
			border: none;
			outline: none;
			cursor: pointer;
			font-family: "微软雅黑", "华文细黑";
			font-size: 17px;
			color: #FFFFFF;
			font-weight: 600;
		}
		
		button.reset {
			background-color: #FF0000;
		}
		
		button.query {
			background-color: #1296DB;
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
			<span class="hint">正在对容器：<span id="cname"></span>&nbsp;执行数据操作</span>
		</div>
		
		<div class="ct">您可以在此输入C-SQL语句进行数据查询</div>
		
		<div class="editor_control">
			<table style="width: 600px;">
				<tr>
					<td style="width: 500px">
						<div style="text-align: left;"><textarea id="code" style="text-align: left;"></textarea></div>
					</td>
					<td>
						<div class="reset"><button id="reset" class="reset">清空</button></div>
						<div class="query"><button id="query" class="query">查询</button></div>
					</td>
				</tr> 
			</table>
		</div>
		
		<div class="result">
			<!-- 由jQuery动态填充 -->
		</div>
		
		<div class="recordlink">
			<span class="recordlink" id="cid">查看数据导入导出记录</span>
		</div>
	</div>
	
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
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
		var json = <%=request.getAttribute(SecurityKey.SECURITY_CONTAINER_LIST.key) %>
		$(document).ready(function() {
			$("#cname").text(json.name);
			$("#cid").click(function() {
				window.open("<%=path %>/container/transmission/record?cid="+json.id);
			});
		});
	</script>
	
	<script type="text/javascript">
		var editor = CodeMirror.fromTextArea(document.getElementById("code"), {
			lineNumbers: true,
			matchBrackets: true,
			mode: "text/x-sql",
			indentUnit: 4,
			indentWithTabs: true
		});
	</script>
	
	<script type="text/javascript">
		$("#reset").mouseover(function () {
			$("#reset").animate({"background-color": "#EE7A7A"}, 200);
		});
		$("#reset").mouseout(function() {
			$("#reset").animate({"background-color": "#FF0000"}, 200);
		}); 
		$("#query").mouseover(function () {
			$("#query").animate({"background-color": "#56BAEE"}, 200);
		});
		$("#query").mouseout(function() {
			$("#query").animate({"background-color": "#1296DB"}, 200);
		}); 
	</script>
	
	<script type="text/javascript">
		$("#reset").click(function() {
			editor.setValue("");
		});
	</script>
	
</body>
</html>