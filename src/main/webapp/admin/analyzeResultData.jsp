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
<script type="text/javascript" charset="gbk" src="<%=path%>/static/js/echarts.simple.min.js" ></script>

</head>
<body style="margin: 10px">
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
    var option = {
        title: {
            text: '抽样柱状图', //标题文本内容
        },
        toolbox: { //可视化的工具箱
            show: true,
            feature: {
                dataView: { //数据视图
                    show: true
                },
                restore: { //重置
                    show: true
                },
                dataZoom: { //数据缩放视图
                    show: true
                },
                saveAsImage: {//保存图片
                    show: true
                },
                magicType: {//动态类型切换
                    type: ['bar', 'line']
                }
            }
        },
        tooltip: { //弹窗组件
            show: true
        },
        xAxis: {
            data: ["rsxn", "yhwz", "sld", "zwql", "ccwd", "kqqqm","mcld" ,"fsx"]
        },
        yAxis: {},
        series: [{
            name: '属性值',
            type: 'bar',
            data: [${param.rst}]
        }]

    };


    myChart.setOption(option);
</script>

</body>
</html>

