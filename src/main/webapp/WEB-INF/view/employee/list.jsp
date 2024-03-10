<%@ page import="java.util.List" %>
<%@ page import="fsa.training.model.dto.EmployeeListDto" %><%--
  Created by IntelliJ IDEA.
  User: thinh
  Date: 3/9/2024
  Time: 5:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee list</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.3/dist/full.min.css" rel="stylesheet" type="text/css"/>

    <style>
        input[type="radio"]:checked {
            background-color: #ccc;
        }
    </style>
</head>

<body>
<div class="flex flex-col ">
    <!-- header_fragment -->
    <header class="bg-[#F8F8F8] flex justify-between fixed top-0 w-full z-10 h-16">
        <!-- logo -->
        <div class="flex items-center ml-2 justify-center text-gray-600 gap-2">
            <i class="fa-solid fa-users text-2xl"></i>
            <a href="/employeeList_assi_01.html" class="text-2xl font-medium text-center ">Employee</a>
        </div>
        <!-- logout -->
        <div class="flex items-center mr-4 justify-center text-purple-600 gap-6">
                <span>
                    Welcome Long
                </span>
            <div>
                <i class="fa-solid fa-right-from-bracket"></i>
                <a href="" class="">Logout</a>
            </div>
        </div>
    </header>

    <div class="bg-[#ccc] flex top-16 relative">
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
                    <div class="border-b-2 p-3 text-blue-500">
                        <i class="fa-solid fa-list"></i>
                        <a href="#" class="">Employee list</a>
                    </div>
                    <div class="border-b-2 p-3 text-blue-500">
                        <i class="fa-solid fa-plus"></i>
                        <a href="#" class="">Add Employee</a>
                    </div>
                </div>
            </div>

        </sidebar>
        <!-- content -->
        <div class="w-4/5 bg-white p-2">
            <h1 class="font-medium py-3 text-4xl">Employee List</h1>
            <div class="p-3  border-t-[1px] border-solid border-slate-300">
                <!-- action_sort -->
                <form class="flex justify-end  mx-auto gap-2 rounded-l-sm ">
                    <!-- <label for="default-search p-2 bg-[#ccc]"
                        class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label> -->
                    <!-- search -->
                    <div class="relative flex items-center w-96">
                        <div
                                class=" w-12 rounded-l-sm  bg-[#eeeeee] p-3  w-12 flex items-center justify-center inset-y-0 start-0 flex items-center  pointer-events-none">
                            <svg class="w-4 h-4 text-gray-500 " aria-hidden="true"
                                 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                      stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                            </svg>
                        </div>
                        <input type="search" id="default-search"
                               class="block w-full w-4/5 p-2 border-[1px] border-solid border-slate-300 ps-10 text-sm text-gray-900 rounded-r-lg bg-white  "
                               placeholder="User Search" required/>
                    </div>
                    <!-- sort -->
                    <div class="relative flex items-center ml-3">
                        <div
                                class="p-2 rounded-l-sm bg-[#eeeeee] gap-3 px-4 flex items-center justify-center inset-y-0 start-0 flex items-center  pointer-events-none">
                            <i class="fa-solid fa-filter"></i>
                            <span>Filter By</span>
                        </div>
                        <div class="dropdown border-[1px] border-solid border-[#ccc]">
                            <div tabindex="0" role="button" class="ml-2 p-2 w-24 bg-white">
                                Name
                                <i class="fa-solid fa-caret-down"></i>
                            </div>
                            <ul tabindex="0" class="dropdown-content bg-white z-[1] menu  shadow  rounded-box w-52">
                                <li><a>Item 1</a></li>
                                <li><a>Item 2</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- search button -->
                    <button type="submit"
                            class="text-white bg-[#347ab6]
                            hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 ">
                        Search
                    </button>
                </form>

                <!-- table -->
                <div class="overflow-x-auto mt-10">
                    <table class="table border-[1px] border-solid border-[#eeeeee] ">
                        <!-- head -->
                        <thead>
                        <tr class="text-black bg-[#f2f2f2] ">
                            <th class="border-[1px] border-solid border-[#eeeeee]">ID</th>
                            <th class="border-[1px] border-solid border-[#eeeeee]">Name</th>
                            <th class="border-[1px] border-solid border-[#eeeeee]">Date of birth</th>
                            <th class="border-[1px] border-solid border-[#eeeeee]">Address</th>
                            <th class="border-[1px] border-solid border-[#eeeeee]">Phone number</th>
                            <th class="border-[1px] border-solid border-[#eeeeee]">Address</th>
                            <th class="border-[1px] border-solid border-[#eeeeee]">Department</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        <%
                            List<EmployeeListDto> employeeListDtoList = (List<EmployeeListDto>) request.getAttribute("employeeList");
                            for (int i = 0; i < employeeListDtoList.size(); i++) {
                                EmployeeListDto employee = employeeListDtoList.get(i);
                        %>
                        <tr class="">
                            <th class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getId()%>
                            </th>
                            <td class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getFirstName()%>
                            </td>
                            <td class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getDateOfBirth()%>
                            </td>
                            <td class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getAddress()%>
                            </td>
                            <td class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getPhone()%>
                            </td>
                            <td class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getAddress()%>
                            </td>
                            <td class="border-[1px] border-solid border-[#eeeeee]">
                                <%=employee.getDepartmentName()%>
                            </td>

                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>

                <!-- pagination -->
                <div class="border-[1px] mt-10 border-solid border-[#eeeeee] w-fit">
                    <div class="join ">
                        <button
                                class=" w-20 btn rounded-none m-0 p-0 border-[1px] border-solid border-[#ccc]">Previous
                        </button>
                        <input class="join-item btn   border-[1px] border-solid border-[#ccc]" type="radio"
                               name="options" aria-label="1" checked/>
                        <input class="join-item btn  border-[1px] border-solid border-[#ccc]" type="radio"
                               name="options" aria-label="2"/>
                        <input class="join-item btn  border-[1px] border-solid border-[#ccc]" type="radio"
                               name="options" aria-label="3"/>
                        <input class="join-item btn  border-[1px] border-solid border-[#ccc]" type="radio"
                               name="options" aria-label="4"/>
                        <button class="btn rounded-none m-0 p-0 w-20 text-blue-500">Next</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</body>

</html>