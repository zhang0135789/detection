<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../app.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>数据采集页面</title>
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/static/jquery-easyui-1.3.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="<%=path%>/static/jquery-easyui-1.3.3/themes/icon.css">
    <script type="text/javascript"
            src="<%=path%>/static/jquery-easyui-1.3.3/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=path%>/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="<%=path%>/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" charset="gbk"
            src="<%=path%>/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="gbk"
            src="<%=path%>/static/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="gbk"
            src="<%=path%>/static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">

        function submitData() {

            $('#formflag').form('submit', {
                    url:"<%=path%>/admin/data/save.do",
                onSubmit: function(){
                // do some check
                // return false to prevent submit;
            },
            success:function(result){
                if (result == "1") {
                    $.messager.alert("系统提示","数据上传成功成功！");
                    resetValue();
                } else {
                    $.messager.alert("系统提示","数据上传失败失败！");
                }
            }
        });

        }

        // 重置数据
        function resetValue() {
            $("#dataName").val("");
            $("#fb").val("");
        }


        //下拉框
        $('#dataType').combobox({
            data: data,
            valueField: 'code',
            textField: 'description'}
        );

    </script>
</head>
<body style="margin: 10px">
<div id="p" class="easyui-panel" title="" style="padding: 10px">
    <form id="formflag"   method="post" enctype="multipart/form-data" >
        <table cellspacing="20px">
            <tr>
                <td width="100px">采集数据名称：</td>
                <td><input type="text" id="dataName" name="dataName" style="width: 150px;" value=""/></td>
            </tr>
            <tr>
                <td width="80px">上传数据：</td>
                <td style="color: orangered">(只能上传excel文件)</td>
                <td>
                    <%--<input   class="easyui-filebox" style="width:300px" />--%>
                    <input id="filepath" name="filepath" type="file" style="width:300px" class="addImgH_form" target="up">
                </td>
            </tr>

            <td width="100px">产品列表：</td>
            <td><input type="text" id="dataType" name="dataType" style="width: 150px;" value=""/></td>
            <tr>

            <td width="100px">样本信息：</td>
                <td><input type="text" id="dataInfo" name="dataInfo" style="width: 150px;" value=""/></td>
            <tr>

            <td width="100px">记录人员：</td>
                <td><input type="text" id="dataUser" name="dataUser" style="width: 150px;" value=""/></td>
            <tr>


                <td></td>
                <td>
                <a href="javascript:submitData()" class="easyui-linkbutton" data-options="iconCls:'icon-submit'">上传数据</a>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>