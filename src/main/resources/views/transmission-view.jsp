<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>C-SQL查询结果页 - Cloud-Data 数据一体化管理平台</title>
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/public.css" />
    <link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>

	<style type="text/css">
		div.content {
		}
		table {
			border-collapse: collapse;  
			border-spacing: 0;  
		}
		table, td {
			border: 1px solid #797979;
		}
	</style>

</head>
<body>
	<div class="content" id="content"></div>
	<script type="text/javascript">
		var keys = sessionStorage.getItem("cols").split(",");
		var datas= eval('(' + sessionStorage.getItem("datas") + ')');
		sessionStorage.clear();
		$("#content").append("<table id='data'></table>");
		$("#data").append("<tr id='data_line'></tr>");
		for (var i in keys) {
			$("#data_line").append("<td style='background-color:#1296DB;color:#FFFFFF'>"+ keys[i] + "</td>");
		}
		for (var i in datas) {
			var str = "<tr>";
			for (var j in keys) {
				str += "<td style='background:" + ((i%2==0) ? "#FFFFFF" : "rgba(255,255,255,0)") + "'>" + datas[i][keys[j]] + "</td>";
			}
			str += "</tr>";
			$("#data").append(str);
		}
	</script>
</body>
</html>