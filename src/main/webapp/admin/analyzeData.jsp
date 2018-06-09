<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../app.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>抽样分析详情页面</title>
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
<script type="text/javascript">



    function submitData(){
        var p = $("#Progress");
        $("#test1").removeAttr("hidden");
        console.log(${param.id});
        var value = p.progressbar('getValue');
        if (value < 100){
            value ++;
            p.progressbar('setValue', value);
            setTimeout(arguments.callee, 600);
        }else {
            $.post("<%=path%>/admin/data/analyze.do",
                {'id':'${param.id}','dataId':'${param.dataId}'
                },
                function(result){
                    if(result == "1"){
                        $("#test1").attr("hidden" ,true);
                        $("#test2").removeAttr("hidden");

                        $.messager.alert("系统提示","检测成功！");

                    }else{
                        $.messager.alert("系统提示","检测失败！");
                    }
                },
                "json");
        }
	}



</script>

<style type="text/css">
	body{padding:0;margin:0;}
	table{border:#95b8e7 1px solid; border-collapse:collapse; border-spacing:0; text-align:center; font:normal 12px "\5FAE\8F6F\96C5\9ED1";color:#444;}
	table th{height:28px; line-height:28px; background:-webkit-linear-gradient(#eff5fe,#e0ecff); background:-moz-linear-gradient(#eff5fe,#e0ecff); background:-o-linear-gradient(#eff5fe,#e0ecff); background:linear-gradient(#eff5fe,#e0ecff);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#eff5fe', endColorstr='#e0ecff', GradientType=0); border-bottom:#95b8e7 1px solid; border-right:#95b8e7 1px dotted;}
	table td{height:28px; line-height:28px; border:#95b8e7 1px dotted; padding:0px;}
	table tr:nth-child(odd){background: #aed2ee;}
	table tr:hover{background: #2e51ff;}
</style>
</head>
<body style="margin: 10px" background="../static/images/1120.jpg">
<div id="p" class="easyui-panel" title="抽样检测" style="padding: 10px ;background-image: url('../static/images/1120.jpg')" >
 	<table cellspacing="20px">
   		<tr>
   			<td width="100px">抽样检测数据（标识）：</td>
   			<td>
                <input type="text" id="id" name="id" value="${param.id}"  hidden="false">
                <%--<input type="text" id="dataName" name="dataName" style="width: 200px;" value="${param.dataName}" disabled="disabled"/>--%>
				<input type="text" id="dataId" name="dataId" style="width: 300px;" value="${param.dataId}" disabled="disabled"/>

			</td>
   		</tr>

   		<tr>
   			<td valign="top">检测进度：</td>
   			<td>
                <div id="Progress" class="easyui-progressbar" data-options="value:0" style="width:400px;"></div>
            </td>
            <td>
                <div id="test1" hidden="false"><font color="red">检测中...</font></div>
                <div id="test2" hidden="true"><font color="red">检测完成</font></div>
            </td>
   		</tr>

   		<tr>
   			<td></td>
   			<td>
   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">抽样检测</a>
   			</td>
   		</tr>
   	</table>
 </div>


</body>
</html>

