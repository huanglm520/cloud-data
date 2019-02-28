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
    <title>个人主页 - Cloud-Data 数据一体化服务平台</title>
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/toolbar.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/color/jquery.color-2.1.2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script type="text/javascript" src="https://www.echartsjs.com/gallery/vendors/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/timer.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/public.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/toolbar.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/code.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/check.js"></script>

	<style type="text/css">
		div.content {
			width: 950px;
			height: 400px;
			margin: auto;
			margin-bottom: 50px;
		}
		div.statistics {
			height: 400px;
		}
		div#container {
			width: 400px;
		}
		div#loginrecord {
			width: 550px;
			margin-left: 400px;
			margin-top: -400px;
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
				<span class="topbarspan">Cloud-Data&nbsp;数据一体化服务平台</span>
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
		<div class="statistics" id="container"></div>
		<div class="statistics" id="loginrecord"></div>
	</div>
	<div class="bottombar">
		<div class="cr_one">
	    	<span class="copyright">CopyRight&nbsp;&copy;&nbsp;Sunrise(Huang&nbsp;Liming)&nbsp;<%=application.getAttribute(AttributeKey.PAGE_TIME.key) %>&nbsp;All&nbsp;Rights&nbsp;Reserved</span>
	    </div>
	</div>
	
	<script type="text/javascript">
		var jsons = <%=request.getAttribute(SecurityKey.CONTAINER_STATISTICS.key)%>;
		var datas = [];
		var colors = [];
		for (var i=0; i<jsons.length; i++) {
			datas.push(jsons[i].name);
			if (jsons[i].name == "运行中") {
				colors.push("#1AB821");
			} else if (jsons[i].name == "已停用") {
				colors.push("#D1301F");
			} else if (jsons[i].name == "修改中") {
				colors.push("#1460A6");
			} else if (jsons[i].name == "创建中") {
				colors.push("#CFDD14");
			}
		}
		
		var myChart = echarts.init(document.getElementById("container"));
		
		// Echarts3不再支持noDataLoadingOption属性
		// 所以文字信息需要手动添加
		// 防止Echarts初始化清除数据
		// 这段文字需要在初始化之后添加
		// 此代码不要放在外链JS中
		if (jsons.length == 0) {
			$("#container").append('<div id="noData"><span id="noData">您还没有创建<br>任何容器</span></div>');
			$("div#noData").css({
				"width": "100%",
				"text-align": "center",
				"float": "left",
				"margin-top": "-200px"
			});
			$("span#noData").css({
				"font-family": "微软雅黑",
				"font-weight": "600",
				"font-size": "18px",
				"color": "#9CA89C"
			});
		}
		
		option = {
		    title : {
		        text: '容器状态统计',
		        subtext: '不包含已删除容器',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: datas
		    },
		    color: colors,
		    series : [
		        {
		            name: '容器状态',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data: jsons,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
		if (option && typeof option === "object") {
		    myChart.setOption(option, true);
		}
	</script>
	
	<script type="text/javascript">
		// 接收数据
		var jsons1 = <%=request.getAttribute(SecurityKey.SECURITY_LOGIN_RECORD.key)%>;
		var datas1 = [];
		for (var i=0; i<jsons1.length; i++) {
			datas1.push(jsons1[i].name);
		}
		var myChart1 = echarts.init(document.getElementById("loginrecord"));
		option1 = {
		    title : {
		        text: '最近登录情况统计',
		        subtext: '仅展示本月数据',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: datas1
		    },
		    series : [
		        {
		            name: '登录地点',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data: jsons1,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		};
		if (option1 && typeof option1 === "object") {
		    myChart1.setOption(option1, true);
		}
	</script>
	
</body>
</html>