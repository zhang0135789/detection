<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../app.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>抽样分析页面</title>
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

</head>
<body style="margin: 10px;background-image: url('../static/images/1120.jpg')">
<div id="p" class="easyui-panel" title="抽样检测" style="padding: 10px">
 	<table cellspacing="20px">
   		<tr>
   			<td width="100px">抽样检测数据：</td>
   			<td>
                <input type="text" id="id" name="id" value="${param.id}"  hidden="true">
                <input type="text" id="dataId" name="dataId" style="width: 300px;" value="${param.dataId}" disabled="disabled"/>
            </td>
   		</tr>

   		<tr>
   			<td valign="top">检测进度：</td>
   			<td>
                <div  class="easyui-progressbar" data-options="value:100" style="width:400px;"></div>
            </td>
            <td>
                <div id="hege" hidden="true"><font color="red">检测中...</font></div>
                <div id="buhege" ><font color="red">检测完成</font></div>
            </td>
   		</tr>

        <tr>
            <td>抽样检测柱状图：</td>
            <td>
                <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
                <div id="main" style="width: 600px;height:400px;"></div>
            </td>
        </tr>

   		<tr>
   			<%--<td>本次抽检结果：</td>--%>
   			<%--<td>--%>
                <%--<div ><font color="red">--%>
                    <%--<c:if test="${param.anResult == 1 }">合格</c:if>--%>
                    <%--<c:if test="${param.anResult == 0 }">不合格</c:if>--%>
                <%--</font></div>--%>
   			<%--</td>--%>
   		</tr>
   	</table>
 </div>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据

    option = {
        title: {
            text: '产品性能对比雷达图'
        },
        tooltip: {},
        legend: {
            data: ['产品性能对比']
        },
        radar: {
            // shape: 'circle',
            name: {
                textStyle: {
                    color: '#fff',
                    backgroundColor: '#999',
                    borderRadius: 3,
                    padding: [3, 5]
                }
            },
            indicator: [
                { name: '燃烧性能（rsxn）', max: 5},
                { name: '有害物质（yhwz）', max: 5},
                { name: '色牢度（sld）', max: 5},
                { name: '织物强力（zzql）', max: 5},
                { name: '尺寸稳定性（ccwdx）', max: 5},
                { name: '抗起球起毛性（kqqqmx）', max: 5},
                { name: '摩擦牢度（mcld）', max: 5},
                { name: '防水性（fsx）', max: 5}
            ]
        },
        series: [{
            name: '产品性能对比',
            type: 'radar',
            // areaStyle: {normal: {}},
            data : [
                {
                    value : [1, 2, 3, 4, 5, 3, 2 ,5],
                    name : '产品性能对比'
                }
            ]
        }]
    };



    myChart.setOption(option);
</script>

</body>
</html>

