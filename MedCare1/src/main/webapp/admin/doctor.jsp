<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.Dbconnect"%>
<%@page import="com.dao.SpecalistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <%@include file="../component/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <!-- Add Doctor Column -->
                        <p class="fs-3 text-center">Add Doctor</p>
                        <c:if test="${not empty errorMsg}">
                            <p class="fs-3 text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>
                        <form action="../addDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label> <input type="text"
                                    required name="fullname" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">DOB</label> <input type="date"
                                    required name="dob" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Qualification</label> <input required
                                    name="qualification" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Specialist</label> <select name="spec"
                                    required class="form-control">
                                    <option>--select--</option>

                                    <%
                                    SpecalistDao dao = new SpecalistDao(Dbconnect.getConn());
                                    List<Specalist> list = dao.getAllSpecalist();
                                    for (Specalist s : list) {
                                    %>
                                    <option><%=s.getSpecalistName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label> <input type="text"
                                    required name="email" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mob No</label> <input type="text"
                                    required name="mobno" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Password</label> <input required
                                    name="password" type="password" class="form-control">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            
            <div class="col-md-8">
                <div class="card paint-card">
                    <div class="card-body">
                        <!-- Doctor Details Column -->
                        <p class="fs-3 text-center">Doctor Details</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">DOB</th>
                                    <th scope="col">Qualification</th>
                                    <th scope="col">Specialist</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mob No</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    DoctorDao dao2 = new DoctorDao(Dbconnect.getConn());
                                    List<Doctor> list2 = dao2.getAllDoctor();
                                    for(Doctor d:list2) { %>
                                        <tr>
                                            <td><%=d.getFullName() %></td>
                                            <td><%=d.getDob() %></td>
                                            <td><%=d.getQualification() %></td>
                                            <td><%=d.getSpecalist() %></td>
                                            <td><%=d.getEmail() %></td>
                                            <td><%=d.getMobNo() %></td>
                                            <td>
                                                <a href="edit_doctor.jsp?id=<%=d.getId()  %>" class="btn btn-primary">Edit</a>
                                                <a href="#" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
