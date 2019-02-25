<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CSQL 查询结果页</title>

	<link rel="icon" href="https://huanglm520.github.io/cloud-data.static.io/images/cloud.png" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="https://huanglm520.github.io/cloud-data.static.io/scripts/css/jquery-ui-mine.css" />

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://huanglm520.github.io/cloud-data.static.io/scripts/js/jquery-ui.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            outline: none;
        }
        /* body {
            height: 5000px;
        } */
        div.content {
            padding: 10px;
        }
        div.title {
            background-color: #EDF9FF;
            padding: 10px;
            font-family: "微软雅黑", "华文细黑";
            font-size: 16px;
            /* font-weight: 600; */
            color:#5F6981;
            border-radius: 5px;
            position: fixed;
            /* text-align: center; */
            /* width: 100%; */
        }
        table {
			border-collapse: collapse;  
			border-spacing: 0;  
            margin-top: 50px;
		}
		table, td {
			border: 1px solid #EBEFF5;
		}
        td {
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            color: #919499;
            min-width: 80px;
            max-width: 260px;
            font-size: 13px;
            cursor: pointer;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        span {
            cursor: pointer;
        }
        tr.qian {
            background-color: #ffffff;
        }
        tr.shen {
            background-color: #F8F5F5;
            /* font-size: 15px; */
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

    <div id="pop" title="字段内容"></div>
    <div class="quarantine" id="quarantine"></div>

    <div class="content">
        <div class="title"></div>
        <table id="data"></table>
    </div>

    <script type="text/javascript">
        // 设置title宽度
        function resizeTitle() {
            $("div.title").width($("div.content").width()-20);
        }
        // 加载窗口时绘制title宽度
        $(document).ready(function() {
            resizeTitle();

            var name = sessionStorage.getItem("name");
            if (name==null || name==undefined) {
            	$("div.title").append("暂无查询结果");
            	return;
            } else {
            	$("div.title").append("容器：" + name + " 上的查询结果");
            }
            	
            var keys = sessionStorage.getItem("cols").split(",");
            var datas= eval('(' + sessionStorage.getItem("datas") + ')');
            sessionStorage.clear();

            $("#data").append("<tr id='data_line' class='shen'></tr>");
            for (var i in keys) {
                $("#data_line").append("<td>"+ keys[i] + "</td>");
            }
            for (var i in datas) {
                var str = "<tr class='" + (i%2==0 ? "qian" : "shen") + "'>";
                for (var j in keys) {
                    str += "<td onclick='showFieldData(this)'>" + datas[i][keys[j]] + "</td>";
                }
                str += "</tr>";
                $("#data").append(str);
            }
        });
        // 窗口大小变化时重绘title宽度
        $(window).resize(function() {
            resizeTitle();
        });
    </script>

    <script type="text/javascript">
        function showFieldData(obj) {
            $("#quarantine").css("display", "block");
            $("#pop").empty();
            $("#pop").append($(obj).text());
            $("#pop").dialog({
                height: 300,
                width: 400,
                model: true,
                draggable: false,
               /* buttons: {
                    "关闭": function() {
                        $(this).dialog("close");
                        $("#quarantine").css("display", "none");
                    }
                },*/
                /*open: function(event, ui) {
                	$(".ui-dialog").css({"border-radius":"7px"});
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                }*/
                close: function () {
                	$(this).dialog("close");
                    $("#quarantine").css("display", "none");
				}
            });
        }
    </script>
</body>
</html>