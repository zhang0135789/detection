<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../app.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分析结果导出页面</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="<%=path%>/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>


<script type="text/javascript">

    function formatState1(val,row){
        if(val == 1) {
            return  '<font color="#228b22">已检测</font>';
        }else {
            return  '<font color="red">未检测</font>';
        }
    }
    function formatState2(val,row){
        if(val == 1) {
            return  '<font color="#228b22">已预测</font>';
        }else {
            return  '<font color="red">未预测</font>';
        }
    }
	

	
	
	function openBlogModifyTab(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一个条数据！");
			 return;
		 }
		 var row=selectedRows[0];

		 if(row.stateAnalyze=="1") {



             console.log("ajaxDownloadSynchronized");
             var url = "<%=path%>/admin/data/exportExcel.do?dataId="+row.dataId;
             var fileName = "检测数据结果表.xls";
             var form = $("<form></form>").attr("action", url).attr("method", "post");
             form.append($("<input></input>").attr("type", "hidden").attr("name", "fileName").attr("value", fileName));
             form.appendTo('body').submit().remove();
		 }else {
             $.messager.alert("系统提示","请先检测数据，在进行导出操作！");
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
<body style="margin: 1px">
<table id="dg" title="分析结果导出" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="<%=path%>/admin/data/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
		<th field="cb" checkbox="true" align="center"></th>
		<th field="id" width="20" align="center">编号</th>
		<th field="dataId" width="20" align="center" >通配标识</th>
		<th field="dataName" width="200" align="center" >采集数据名称</th>
		<th field="createDate" width="50" align="center">采集日期</th>
		<th field="stateAnalyze" width="50" align="center" formatter="formatState1">检测状态</th>
		<th field="stateForecast" width="50" align="center" formatter="formatState2">预测状态</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openBlogModifyTab()" class="easyui-linkbutton" iconCls="icon-redo" plain="true">导出excel</a>
 		<%--<a href="javascript:deleteBlog()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>--%>
 	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
 	<div>
 	</div>
 </div>
</body>
</html>