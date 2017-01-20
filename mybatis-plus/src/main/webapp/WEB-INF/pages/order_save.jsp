<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>编辑</title>
    <%@include file="common/include.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8">
            <form id="form" role="form">
                <div class="form-group">
                    <label for="name">用户ID</label>
                    <input type="text" class="form-control" id="order_id" name="order_id" value="${order.order_id}" placeholder="请输入订单ID">
                </div>
                <div class="form-group">
                    <label for="name">用户ID</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" value="${order.user_id}" placeholder="请输入用户ID">
                </div>
                <div class="form-group">
                    <label for="age">状态</label>
                    <input type="text" class="form-control" id="status" name="status" value="${user.status}" placeholder="请输入状态">
                </div>
                <button type="button" onclick="save()" class="btn btn-default">保存</button>
                <button type="reset" class="btn btn-default">取消</button>
            </form>
        </div>
    </div>
</div>
<script>
    function save() {
        $.ajax({
            type: 'POST',
            url: '${ctx}/order/save',
            data: $('#form').serialize(),
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
