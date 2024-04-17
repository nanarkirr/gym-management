<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gym Management</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<%
    if (session.getAttribute("add") != null) {
%>
<script>
    alert('<%= session.getAttribute("add") %>');
</script>
<%
    }
%>
<div class="center">
    <h3>Welcome to Gym Management Solution</h3>
    <a href="add-batch.html">Add Batch</a>
    <br/>
    <a href="add-participant.jsp">Add Participant</a>
    <br/>
    <a href="update-batch.jsp">Update Batch</a>
    <br/>
    <a href="update-participant.jsp">Update Participant</a>
</div>

</body>
</html>