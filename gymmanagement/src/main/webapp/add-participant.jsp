<%@page import="org.example.gymmanagement.helper.DBUtil,java.sql.*" %>
<%@ page import="org.example.gymmanagement.model.Batch" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.gymmanagement.dao.BatchDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Participant</title>
    <style>
        .center {
            margin: auto;
            width: 60%;
            border: 3px solid #2222FF;
            padding: 10px;
        }
    </style>
</head>
<body>
<div class="center">
    <h3>Add New Participant</h3>
    <form action="ParticipantController" method="post">
        <label for="name">Full Name:</label><br>
        <input type="text" id="name" name="name" placeholder="John Watson"/><br><br>
        <label for="phone">Phone : </label><br>
        <input type="text" id="phone" name="phone" placeholder="+91 99999 11111"/><br><br>
        <label for="email">Email : </label><br>
        <input type="text" id="email" name="email" placeholder="john@example.com"/><br><br>
        <label for="bid">Batch Name : </label><br>

        <select id="bid" name="bid">
            <%
                BatchDao bd = new BatchDao(new DBUtil());
                List<Batch> v = bd.getBatch();
                Iterator<Batch> it = v.iterator();
                while (it.hasNext()) {
                    Batch b = it.next();
            %>
            <option value="<%= b.getBid() %>"><%= b.getbName() %>
            </option>
            <% } %>
        </select><br><br>
        <input type="submit" value="submit">
    </form>
</div>
</body>
</html>
