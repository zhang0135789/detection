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
<script type="text/javascript">



	function submitData(){
		<%--var title=$("#title").val();--%>
		<%--var blogTypeId=$("#blogTypeId").combobox("getValue");--%>
		<%--var content=UE.getEditor('editor').getContent();--%>
		<%--var keyWord=$("#keyWord").val();--%>

		<%--if(title==null || title==''){--%>
			<%--alert("请输入标题！");--%>
		<%--}else if(blogTypeId==null || blogTypeId==''){--%>
			<%--alert("请选择博客类别！");--%>
		<%--}else if(content==null || content==''){--%>
			<%--alert("请输入内容！");--%>
		<%--}else{--%>
			<%--$.post("<%=path%>/admin/blog/save.do",{'id':'${param.id}','title':title,'blogType.id':blogTypeId,'content':content,'contentNoTag':UE.getEditor('editor').getContentTxt(),'summary':UE.getEditor('editor').getContentTxt().substr(0,155),'keyWord':keyWord},function(result){--%>
				<%--if(result.success){--%>
					<%--alert("博客修改成功！");--%>
				<%--}else{--%>
					<%--alert("博客修改失败！");--%>
				<%--}--%>
			<%--},"json");--%>
		<%--}--%>
	}




</script>
</head>
<body style="margin: 10px">
<div id="p" class="easyui-panel" title="抽样检测" style="padding: 10px">
 	<table cellspacing="20px">
   		<tr>
   			<td width="100px">抽样检测数据：</td>
   			<td>
                <input type="text" id="id" name="id" value="${param.id}"  hidden="true">
                <input type="text" id="dataId" name="dataId"  value="${param.dataId}" hidden="false"/>
                <input type="text" id="dataName" name="dataName" style="width: 200px;" value="${param.dataName}" disabled="disabled"/>
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
   			<td>本次抽检结果：</td>
   			<td>
                <div ><font color="red">
                    <c:if test="${param.anResult == 1 }">合格</c:if>
                    <c:if test="${param.anResult == 0 }">不合格</c:if>
                </font></div>
   			</td>
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


    // option = {
    //     title : {
    //         text: '产品属性',
    //         subtext: '纯属虚构'
    //     },
    //     tooltip : {
    //         trigger: 'axis'
    //     },
    //     legend: {
    //         data:['属性值']
    //     },
    //     toolbox: {
    //         show : true,
    //         feature : {
    //             dataView : {show: true, readOnly: false},
    //             magicType : {show: true, type: ['line', 'bar']},
    //             restore : {show: true},
    //             saveAsImage : {show: true}
    //         }
    //     },
    //     calculable : true,
    //     xAxis : [
    //         {
    //             type : 'category',
    //             data : ['燃烧性能','有害物质','色牢度','织物强力','尺寸稳定性','抗起球起毛性','摩擦牢度','防水性']
    //         }
    //     ],
    //     yAxis : [
    //         {
    //             type : 'value'
    //         }
    //     ],
    //     series : [
    //         {
    //             name:'属性值',
    //             type:'bar',
    //             data:[1, 2, 3, 4, 5, 4, 5, 2],
    //             markPoint : {
    //                 data : [
    //                     {type : 'max', name: '最大值'},
    //                     {type : 'min', name: '最小值'}
    //                 ]
    //             },
    //             markLine : {
    //                 data : [
    //                     {type : 'average', name: '平均值'}
    //                 ]
    //             }
    //         }
            // {
            //     name:'降水量',
            //     type:'bar',
            //     data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
            //     markPoint : {
            //         data : [
            //             {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
            //             {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
            //         ]
            //     },
            //     markLine : {
            //         data : [
            //             {type : 'average', name : '平均值'}
            //         ]
            //     }
            // }
    //     ]
    // };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

 <%--<script type="text/javascript">--%>

    <%--//实例化编辑器--%>
    <%--//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例--%>
    <%--var ue = UE.getEditor('editor');--%>

    <%--ue.addListener("ready",function(){--%>
        <%--//通过ajax请求数据--%>
        <%--UE.ajax.request("<%=path%>/admin/blog/findById.do",--%>
            <%--{--%>
                <%--method:"post",--%>
                <%--async : false,  --%>
                <%--data:{"id":"${param.id}"},--%>
                <%--onsuccess:function(result){--%>
                	<%--result = eval("(" + result.responseText + ")");  --%>
                	<%--$("#title").val(result.title);--%>
                	<%--$("#keyWord").val(result.keyWord);--%>
       				<%--$("#blogTypeId").combobox("setValue",result.blogType.id);--%>
       				<%--UE.getEditor('editor').setContent(result.content);--%>
                <%--}--%>
            <%--}--%>
        <%--);--%>
    <%--});--%>
    <%----%>
   <%----%>
<%--</script>--%>
</body>
</html>

