<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../app.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预测结果页面</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=path%>/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" charset="gbk" src="<%=path%>/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="<%=path%>/static/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="gbk" src="<%=path%>/static/ueditor/lang/zh-cn/zh-cn.js"></script>
<%--加载柱状图js--%>
    <div id="container" style="height: 100%"></div>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<script type="text/javascript">







</script>
</head>
<body style="margin: 10px;background-image: url('../static/images/1120.jpg')">
<div id="p" class="easyui-panel" title="预测结果" style="padding: 10px">
 	<table cellspacing="20px">
   		<tr>
   			<td width="100px">抽样检测数据：</td>
   			<td>
                <input type="text" id="id" name="id" value="${param.id}"  hidden="true">
                <input type="text" id="dataId" name="dataId" style="width: 300px;" value="${param.dataId}" disabled="disabled"/>
            </td>
   		</tr>

   		<tr>
   			<td valign="top">预测进度：</td>
   			<td>
                <div  class="easyui-progressbar" data-options="value:100" style="width:400px;"></div>
            </td>
            <td>
                <div id="hege" hidden="true"><font color="red">检测中...</font></div>
                <div id="buhege" ><font color="red">预测完成</font></div>
            </td>
   		</tr>

        <tr>
            <td>预测结果折线图：</td>
            <td>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 600px;height:400px;"></div>
            </td>
        </tr>

   		<tr>
            <%--<div ><font color="red">--%>
                <%--<c:if test="${param.foResult == 1 }">合格</c:if>--%>
                <%--<c:if test="${param.foResult == 0 }">不合格</c:if>--%>
            <%--</font></div>--%>
   		</tr>
   	</table>
 </div>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        title : {
            text: '纺织企业产品合格率预测',
            subtext: '预测内容'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['最高合格','最低合格']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月','预测月']
            }
        ],
        yAxis : [
            {
                type : 'value',
                axisLabel : {
                    formatter: '{value}'
                }
            }
        ],
        series : [{
                name:'数据',
                type:'line',
                data:['40','66','30','76','45','66','88','93','50','70','70','84','88']
                }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>


</body>
</html>

