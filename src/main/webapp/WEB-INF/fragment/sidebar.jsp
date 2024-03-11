<%--
  Created by IntelliJ IDEA.
  User: thinh
  Date: 3/11/2024
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- sidebar -->
<!-- sidebar fragment -->
<sidebar class="bg-[#F8F8F8]  w-1/5 h-screen">
    <div class="border-b-2 p-3 text-blue-500">
        <i class="fa-solid fa-gauge"></i>
        <a href="#" class="">Dashboard</a>
    </div>
    <div class="collapse collapse-arrow ">
        <input type="radio" name="my-accordion-2"/>
        <div class="collapse-title ">
            <i class="fa-solid fa-chart-column text-blue-500"></i>
            <a href="#" class="text-blue-500">Employee manager</a>
        </div>
        <div class="collapse-content">
            <div class="<%=request.getAttribute("totalEmployee") != null ? "bg-gray-100 text-black border-b-2 p-3 text-blue-500" :
        "border-b-2 p-3 text-blue-500"%>">
                <i class="fa-solid fa-list"></i>
                <a href="${pageContext.request.contextPath}/employee/list"
                   class="">Employee list</a>
            </div>
            <div class="<%=request.getAttribute("totalEmployee") == null ? "bg-gray-100 text-black border-b-2 p-3 text-blue-500" :
        "border-b-2 p-3 text-blue-500"%>">
                <i class="fa-solid fa-plus"></i>
                <a href="${pageContext.request.contextPath}/employee/add"
                   class="">Add Employee</a>
            </div>
        </div>
    </div>

</sidebar>
</body>
</html>
