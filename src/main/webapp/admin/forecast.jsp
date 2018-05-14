<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../app.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预测页面</title>
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


	
	function openDataModifyTab(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 if(row.stateAnalyze != 1 ) {
             $.messager.alert("系统提示","请先检测数据，再进行预测！");
		 }else if(row.stateForecast == 1){
             $.messager.alert("系统提示","此数据已经预测，请选择其他数据！");
		 }else{
             window.parent.openTab('预测界面', 'forecastData.jsp?id=' + row.id + '&dataName=' + row.dataName+'&dataId='+row.dataId, 'icon-writeblog');
         }
	 }
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="预测" class="easyui-datagrid"
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
 		<a href="javascript:openDataModifyTab()" class="easyui-linkbutton" iconCls="icon-tip" plain="true">预测</a>
 		<%--<a href="javascript:deleteBlog()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>--%>
 	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
 	<div>
 	</div>
 </div>
</body>
</html>