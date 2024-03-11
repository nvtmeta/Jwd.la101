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
    <title> Employee Detail</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.3/dist/full.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="w-full h-fit  bg-white p-2">
    <h1 class="font-medium py-3 text-4xl">Detail Employee</h1>
    <div class="p-3 w-[60rem] border-t-[1px] border-solid border-slate-300">
        <!-- action_sort -->
        <form class="flex flex-col w-full gap-2 rounded-l-sm ">
            <div class="flex flex-col">
                <label class="font-bold">
                    First Name
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="text" placeholder="First name" class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Last Name
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="text" placeholder="Last name" class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Phone number
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="number" placeholder="Phone number"
                       class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Date of birth
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="date" placeholder="Phone number"
                       class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Gender
                    <span class="text-red-500">(*)</span>
                </label>
                <div class="flex items-center mt-3 gap-3">
                    <input type="radio" name="radio-1" class="radio" checked/>
                    <label class="font-bold">Male</label>
                    <input type="radio" name="radio-1" class="radio"/>
                    <label class="font-bold">Female</label>
                </div>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Account
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="text" placeholder="Account" class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Email
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="email" placeholder="Email" class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold">
                    Password
                    <span class="text-red-500">(*)</span>
                </label>
                <input type="password" placeholder="Password"
                       class="input mt-2 input-bordered w-[60rem] "/>
            </div>
            <div class="flex flex-col">
                <label class="font-bold mb-3">
                    Address
                </label>
                <textarea class="textarea textarea-bordered" placeholder=""></textarea>
            </div>
            <div class="flex flex-col">
                <label class="font-bold ">
                    Status
                </label>
                <div class="ml-20 mt-6 flex items-center gap-3">
                    <input type="checkbox" checked="checked" class="checkbox"/>
                    <span>Active</span>
                </div>
            </div>
            <div class="flex flex-col">
                <label class="font-bold mb-3">
                    Department
                    <span class="text-red-500">(*)</span>
                </label>
                <select class="select select-bordered w-full">
                    <option disabled selected>Fsoft Academy</option>
                    <option>Fpt Automation</option>
                </select>
            </div>
            <div class="flex flex-col">
                <label class="font-bold mb-3">
                    Remark
                </label>
                <textarea class="textarea textarea-bordered" placeholder=""></textarea>
            </div>

            <!-- submit , reset. add -->
            <div class="flex mt-3 gap-3">
                <div class="text-white btn btn-info">
                    <i class="fa-solid fa-backward"></i>
                    <span>Back</span>
                </div>

            </div>
        </form>
    </div>
</div>
</body>
</html>
