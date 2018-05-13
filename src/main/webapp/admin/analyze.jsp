<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../app.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分析页面</title>
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
	
//	function formatTitle(val,row){
//		return "<a target='_blank' href='<%=path%>/blog/articles/"+row.id+".html'>"+val+"</a>"
//	}
	
	function searchBlog(){
		$("#dg").datagrid('load',{
			"title":$("#s_title").val() 
		});
	}

	function deleteDatabase(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].id);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
				if(r){
					$.post("<%=path%>/admin/data/delete.do",{ids:ids},function(result){
						if(result== '1'){
							 $.messager.alert("系统提示","数据已成功删除！");
							 $("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","数据删除失败！");
						}
					},"json");
				} 
	   });
	}
	
	
	function openModifyTab(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 console.log(selectedRows);
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一个需要检测的数据！");
			 return;
		 }
        var row = selectedRows[0];
		 console.log(row);
        if(row.stateAnalyze == 1){
            $.messager.alert("系统提示","已经检测，请勿重复操作！");
            return;
        }else {
            row=selectedRows[0];
            window.parent.openTab('抽样检测','analyzeData.jsp?id='+row.id+'&dataName='+row.dataName+'&dataId='+row.dataId,'icon-writeblog');
        }

	}
	
</script>
</head>
<body style="margin: 1px">
<table id="dg" title="分析" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="<%=path%>/admin/data/list.do" fit="true" toolbar="#tb">
   <thead>
   	<tr>
		<th field="cb" checkbox="true" align="center"></th>
        <th field="id" width="20" align="center">编号</th>
		<th field="dataId" width="20" align="center" >通配标识</th>
        <th field="dataName" width="200" align="center" >采集数据名称</th>
        <th field="createDate" width="50" align="center">采集日期</th>
        <th field="stateAnalyze" id="stateAnalyze" width="50" align="center" formatter="formatState1">检测状态</th>
        <th field="stateForecast" width="50" align="center" formatter="formatState2">预测状态</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openModifyTab()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">分析</a>
 		<a href="javascript:deleteDatabase()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
 	<div>
 		&nbsp;标题：&nbsp;<input type="text" id="s_title" size="20" onkeydown="if(event.keyCode==13) searchBlog()"/>
 		<a href="javascript:searchBlog()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
</body>
</html>