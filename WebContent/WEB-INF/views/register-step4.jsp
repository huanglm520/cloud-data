<%@page import="cn.net.sunrise.su.enums.AttributeKey"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page pageEncoding="UTF-8" language="java" %>
<% String path = request.getContextPath(); %>
<%
	boolean isAccept = session.getAttribute(AttributeKey.REGISTER_STEP1.key)!=null && session.getAttribute(AttributeKey.REGISTER_STEP2.key)!=null && session.getAttribute(AttributeKey.REGISTER_STEP3.key)!=null;
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
    <title>注册用户(第4/4步) - Cloud-Data 数据一体化管理平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/passport.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/register.css" />
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
    	div.trueDiv, div.falseDiv {
    		width: 100%;
    		text-align: center;
    	}
    	
    	span.trueSpan, span.falseSpan {
    		font-family: "微软雅黑", "华文细黑";
    		font-size: 16px;
    	}
    	span.trueSpan {
    		color: #4BB850;
    	}
    	span.falseSpan {
    		color: #EA2A40;
    	}
    	
    	img.tag {
    		width: 100px;
    		height: 100px;
    	}
    	
    	div.quarantine {
			width: 100%;
			height: 100%;
			background-color: rgba(142,145,147,0.4);
			position: absolute;
			z-index: 1;
			display: none;
		}
    </style>

</head>
<body>

	<% if (isAccept) { %>
	<div id="pop" title="账户已创建"></div>
	<!-- 添加屏幕隔离层 -->
	<div class="quarantine" id="quarantine"></div>
	<% } %>
	
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
				<span class="user">注册用户(第4/4步)</span>
			</div>
		</div>
	</div>
	
    <div class="passport">
    	
    	<!-- 绘制进度条 -->
    	<div class="progress">
    		<a href="<%=path%>/passport/register/step1"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">1</span>
    			</div>
    		</div></a>
    		<div class="p_line used"></div>
    		<a href="<%=path%>/passport/register/step2"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">2</span>
    			</div>
    		</div></a>
    		<div class="p_line used"></div>
    		<a href="<%=path%>/passport/register/step3"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">3</span>
    			</div>
    		</div></a>
    		<div class="p_line used"></div>
    		<a href="<%=path%>/passport/register/step4"><div class="p_number used">
    			<div class="p_number_inner">
    				<span class="p_number">4</span>
    			</div>
    		</div></a>
    	</div>
    	
    	<div class="info">

			<% if (isAccept) { %>
				<div style="width: 400px; margin-top: 20px; text-align: center;" id="error">
	    			<span class="error" v-show="isFailed"></span>
	    		</div>
    		<% } %>
    		
    		<% if (isAccept) { %>
    			<div class="trueDiv">
    				<div><img class="tag" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTM3MzMxOTcxNTk0IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjE2MjIiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNOTEyIDMyNS4xYzAgMTMuOC00LjggMjUuNS0xNC40IDM1LjFMNTIzLjkgNzMzLjlsLTcwLjMgNzAuM2MtOS42IDkuNi0yMS40IDE0LjQtMzUuMSAxNC40LTEzLjggMC0yNS41LTQuOC0zNS4xLTE0LjRsLTcwLjMtNzAuMy0xODYuNy0xODYuOGMtOS42LTkuNi0xNC40LTIxLjQtMTQuNC0zNS4xIDAtMTMuOCA0LjgtMjUuNSAxNC40LTM1LjFsNzAuMy03MC4zYzkuNi05LjYgMjEuNC0xNC40IDM1LjEtMTQuNCAxMy44IDAgMjUuNSA0LjggMzUuMSAxNC40TDQxOC42IDU1OWwzMzguNS0zMzkuMWM5LjYtOS42IDIxLjQtMTQuNCAzNS4xLTE0LjQgMTMuOCAwIDI1LjUgNC44IDM1LjEgMTQuNGw3MC4zIDcwLjNjOS41IDkuNSAxNC40IDIxLjIgMTQuNCAzNC45eiIgcC1pZD0iMTYyMyIgZmlsbD0iIzRCQjg1MCI+PC9wYXRoPjwvc3ZnPg==" /></div>
    				<div><span class="trueSpan">您的信息已经填写完整，请点击完成按钮</span></div>
    			</div>
    		<% } else { %>
    			<div class="falseDiv">
    				<div><img class="tag" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/PjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+PHN2ZyB0PSIxNTM3MzMyMTYyMjk0IiBjbGFzcz0iaWNvbiIgc3R5bGU9IiIgdmlld0JveD0iMCAwIDEwMjQgMTAyNCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHAtaWQ9IjI0MjEiIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMjU2IiBoZWlnaHQ9IjI1NiI+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48L3N0eWxlPjwvZGVmcz48cGF0aCBkPSJNODg2LjUyOCA5MDguMDMyYy0yOC4wOTYgMjguMDk2LTczLjg1NiAyOC4wOTYtMTAyLjAxNiAwTDEzOC4zMDQgMjYxLjgyNGMtMjguMDk2LTI4LjE2LTI4LjE2LTczLjg1NiAwLTEwMi4wMTYgMjguMDMyLTI4LjE2IDczLjc5Mi0yOC4xNiAxMDIuMDggMGw2NDYuMTQ0IDY0Ni4xNDRDOTE0LjYyNCA4MzQuMjQgOTE0Ljc1MiA4NzkuODcyIDg4Ni41MjggOTA4LjAzMkw4ODYuNTI4IDkwOC4wMzJ6TTg4NS43NiAyNjEuNTA0IDIzOS42MTYgOTA3LjY0OGMtMjguMjI0IDI4LjIyNC03My45MiAyOC4yMjQtMTAyLjA4IDAtMjguMTYtMjguMDk2LTI4LjE2LTczLjcyOCAwLjA2NC0xMDIuMDE2TDc4My43NDQgMTU5LjU1MmMyOC4yMjQtMjguMTYgNzMuOTg0LTI4LjE2IDEwMi4wMTYtMC4wNjRDOTEzLjk4NCAxODcuNjQ4IDkxMy44NTYgMjMzLjM0NCA4ODUuNzYgMjYxLjUwNEw4ODUuNzYgMjYxLjUwNHoiIHAtaWQ9IjI0MjIiIGZpbGw9IiNFQTJBNDAiPjwvcGF0aD48L3N2Zz4=" /></div>
    				<div><span class="falseSpan">您填写的信息不完整，无法继续</span></div>
    			</div>
    		<% } %>

    		<div class="line">
    			<hr />
    		</div>
    		<% if (isAccept) { %>
	    		<div class="submit">
	    			<button class="submit" id="submit">完成</button>
	    		</div>
    		<% } %>
    		
    		<!-- 绘制底部链接 -->
    		<div class="bottom">
    			<div class="b_left">
    				<a href="<%=path%>/passport/register/step3"><span class="bottom">返回上一步</span></a>
    			</div>
    			<div class="b_right">
    				<a href="<%=path %>/passport/login"><span class="bottom">已有账号</span></a>
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
    
    <% if (isAccept) { %>
    
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
    		
    		disable();
    		
    		// 发起请求
    		$.ajax({
    			url: "<%=path %>/passport/register/step4/",
    			type: "POST",
    			timeout: 5000,
    			async: true,
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
    					$("#pop").append("账号注册已完成，单机确定按钮跳转到登录页面");
    				} else {
    					if (data.code == Code["SERVER_ERROR"]) {
    						$(".error").text("服务端发生未知错误，请稍后重试");
    						$error.isFailed = true;
    					}
    					enable();
    				}
    			}
    		});
    		
    	}
    </script>
	    
    <% } %>
</body>