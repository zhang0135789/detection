<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../app.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据预测页面</title>
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
<div id="p" class="easyui-panel" title="预测界面" style="padding: 10px">
 	<table cellspacing="20px">
   		<tr>
   			<td width="80px">预测数据：</td>
   			<td>
                <input type="text" id="id" name="id" value="${param.id}"  hidden="false">
                <input type="text" id="dataName" name="dataName" style="width: 200px;" value="${param.dataName}" disabled="disabled"/>
            </td>
   		</tr>

   		<tr>
   			<td valign="top">预测进度：</td>
   			<td>
                <div id="Progress" class="easyui-progressbar" data-options="value:0" style="width:400px;"></div>
            </td>
            <td>
                <div id="test1" hidden="true"><font color="red">检测中...</font></div>
                <div id="test2" hidden="true"><font color="red">检测完成</font></div>
            </td>
   		</tr>

   		<tr>
   			<td></td>
   			<td>
   				<a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">数据预测</a>
   			</td>
   		</tr>
   	</table>
 </div>

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

