<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017/2/24
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <%@include file="../header.jsp" %>
    <title>客户分配</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 客户相关 <span
        class="c-gray en">&gt;</span> 客户分配 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="cl pd-5 bg-1 bk-gray"> <span
        class="r">共有数据：<strong>${fn:length(requestScope.customers)}</strong> 条</span></div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover table-sort">
        <thead>
        <tr class="text-c">
            <th width="50">ID</th>
            <th width="70">姓名</th>
            <th width="50">性别</th>
            <th width="100">状态</th>
            <th width="70">来源</th>
            <th width="60">类型</th>
            <th width="100">添加时间</th>
            <th width="100">手机</th>
            <th width="160">邮箱</th>
            <th width="80">操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="#request.customers">
            <tr class="text-c">
                <td>${customer_id }</td>
                <td class="text-l"><u style="cursor:pointer" class="text-primary"
                                      onClick="showDetail('name',${customer_id})"
                                      title="详细信息">${customer_name}</u></td>
                <td>${customer_sex}</td>
                <td>${condition_name}</td>
                <td>${source_name}</td>
                <td>${type_name}</td>
                <td>${customer_addtime}</td>
                <td>${customer_mobile}</td>
                <td><a href="mailto:${customer_email}">${customer_email}</a></td>
                <td class="f-14 td-manage"><a style="text-decoration:none" class="ml-5"
                                              onClick="allocation(${customer_id})"
                                              href="javascript:;" title="分配"><i class="Hui-iconfont">
                    &#xe634;</i></a> <a
                        style="text-decoration:none" class="ml-5"
                        onClick="article_del(this,'${customer_id}')"
                        href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </s:iterator>


        </tbody>
    </table>
</div>
</div>
<jsp:include page="../footer.jsp"/>

<script type="text/javascript"
        src="<%=path%>/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=path%>/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="<%=path%>/lib/iCheck/1.0.2/icheck.min.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        //"aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [9]}// 不参与排序的列
        ]
    });
    function allocation(customer_id) {
        layer_show("客户分配","<%=path%>/customer-info/allocation-dialog.action?ids="+customer_id,"300","220")
    }
    function refresh() {
        window.location.replace('<%=path%>/customer-info/allocation.action');
    }
</script>
</body>
</html>
