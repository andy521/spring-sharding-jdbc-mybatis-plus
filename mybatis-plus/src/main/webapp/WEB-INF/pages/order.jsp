<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户列表</title>
    <%@include file="common/include.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8">
            <br/>
            <div class="panel panel-default">
                <div class="panel-body">
                    <button type="button" onclick="preSave()" class="btn btn-default">添加</button>
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>订单ID</th>
                        <th>用户ID</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.order_id}</td>
                            <td>${order.user_id}</td>
                            <td>${order.status}</td>
                            <td>
                                <a href="javascript:void(0);" onclick="preSave('${user.id}')" title="编辑">
                                    <i class="glyphicon glyphicon-edit"></i>
                                </a>
                                <a href="javascript:void(0);" onclick="del('${user.id}')" title="删除">
                                    <i class="glyphicon glyphicon-remove"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    function preSave(id) {
        if (id == undefined || id == null || id == '') {
            window.location.href = '${ctx}/order/preSave';
        } else {
            window.location.href = '${ctx}/order/preSave?id=' + id;
        }
    }

    function del(id) {
        $.ajax({
            type: 'POST',
            url: '${ctx}/order/delete',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (data) {
                alert(data.msg);
                if (data.success) {
                    setTimeout('toOrderIndex()', 100);
                }
            },
            error: function () {
                alert("出错了,请重试!");
            }
        });
    }
</script>
</body>
</html>
