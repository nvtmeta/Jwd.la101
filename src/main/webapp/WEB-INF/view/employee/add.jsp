<%--
  Created by IntelliJ IDEA.
  User: thinh
  Date: 3/11/2024
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.3/dist/full.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<div class="flex flex-col">
    <jsp:include page="../../fragment/header.jsp"/>
    <div class="bg-[#ccc] flex top-16 relative">
        <jsp:include page="../../fragment/sidebar.jsp"/>
        <div class="w-full h-fit  bg-white p-2">
            <h1 class="font-medium py-3 text-4xl">Add Employee</h1>
            <div class="p-3 w-[60rem] border-t-[1px] border-solid border-slate-300">
                <!-- action_sort -->
                <form method="post" action="${pageContext.request.contextPath}/employee/add"
                      class="flex flex-col w-full gap-2 rounded-l-sm ">
                    <div class="flex flex-col">
                        <label class="font-bold">
                            First Name
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="firstName" size="50" type="text" placeholder="First name"
                               class="input mt-2 input-bordered w-[60rem] "/>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Last Name
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="lastName" size="50" type="text" placeholder="Last name"
                               class="input mt-2 input-bordered w-[60rem] "/>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Phone number
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="phoneNumber" size="50" type="number" placeholder="Phone number"
                               class="input mt-2 input-bordered w-[60rem] "/>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Date of birth
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="dateOfBirth" type="date" placeholder="Phone number"
                               class="input mt-2 input-bordered w-[60rem] "/>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Gender
                            <span class="text-red-500">(*)</span>
                        </label>
                        <div class="flex items-center mt-3 gap-3">
                            <input required id="male" value="1" type="radio" name="gender" class="radio"/>
                            <label for="male" class="font-bold">Male</label>
                            <input  required id="female" value="0" type="radio" name="gender" class="radio"/>
                            <label for="female" class="font-bold">Female</label>
                        </div>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Account
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="account" size="50" type="text" placeholder="Account"
                               class="input mt-2 input-bordered w-[60rem] "/>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Email
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="email" size="50" type="email" placeholder="Email"
                               class="input mt-2 input-bordered w-[60rem] "/>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold">
                            Password
                            <span class="text-red-500">(*)</span>
                        </label>
                        <input required name="password" size="100" type="password" placeholder="Password"
                               class="input mt-2 input-bordered w-[60rem] "/>
                        <% String message = request.getParameter("message"); %>
                        <% if (message != null && !message.isEmpty()) { %>
                        <p class="text-red-600">
                            <%=message%>
                        </p>
                        <% } %>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold mb-3">
                            Address
                        </label>
                        <textarea name="address" size="50" class="textarea textarea-bordered" placeholder=""></textarea>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold ">
                            Status
                        </label>
                        <div class="ml-20 mt-6 flex items-center gap-3">
                            <input required name="status" type="checkbox" value="1" class="checkbox"/>
                            <span>Active</span>
                        </div>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold mb-3">
                            Department
                            <span class="text-red-500">(*)</span>
                        </label>
                        <select required name="departmentName" class="select select-bordered w-full">
                            <option value="fsoft academy"  selected>Fsoft Academy</option>
                            <option value="fpt automation">Fpt Automation</option>
                        </select>
                    </div>
                    <div class="flex flex-col">
                        <label class="font-bold mb-3">
                            Remark
                        </label>
                        <textarea name="remark" class="textarea textarea-bordered" placeholder=""></textarea>
                    </div>

                    <!-- submit , reset. add -->
                    <div class="flex mt-3 gap-3">
                        <a href="${pageContext.request.contextPath}/employee/list" class="text-white btn btn-info">
                            <i class="fa-solid fa-backward"></i>
                            <span>Back</span>
                        </a>
                        <button type="reset" class="text-white btn bg-orange-500">
                            <i class="fa-solid fa-rotate-right"></i>
                            <span>Reset</span>
                        </button>
                        <button type="submit" class="text-white btn bg-green-500">
                            <i class="fa-solid fa-plus"></i>
                            <span>Add</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>
