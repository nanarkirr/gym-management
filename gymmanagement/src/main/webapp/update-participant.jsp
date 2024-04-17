<%@page import="org.example.gymmanagement.model.Participant" %>
<%@page import="java.util.*" %>
<%@page import="org.example.gymmanagement.helper.DBUtil" %>
<%@page import="org.example.gymmanagement.dao.ParticipantDao" %>
<%@ page import="org.example.gymmanagement.dao.BatchDao" %>
<%@ page import="org.example.gymmanagement.model.Batch" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Batch</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1 class="m-3">Update Participant</h1>
<div class="row">
    <div class="col-10 offset-1">
        <table class="table table-striped">
            <tr>
                <th>Pid</th>
                <th>Name</th>
                <th>Email</th><!-- comment -->
                <th>Phone</th>
                <th>Bid</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <%
                ParticipantDao pd = new ParticipantDao(new DBUtil());
                List<Participant> participants = pd.getParticipant();
                Iterator<Participant> iteratorParticipant = participants.iterator();
                while (iteratorParticipant.hasNext()) {
                    Participant p = iteratorParticipant.next();

            %>
            <tr>
                <td><%= p.getPid() %>
                </td>
                <td><%= p.getName()%>
                </td>
                <td><%= p.getEmail()%>
                </td>
                <td><%= p.getPhone()%>
                </td>
                <td><%= p.getBid()%>
                </td>
                <td><i class="bi bi-pencil-square" style="color:green" data-bs-toggle="modal"
                       data-bs-target="#exampleModal"></i></td>
                <td><a href="deleteParticipant?pid=<%= p.getPid() %>" class="bi bi-trash" style="color:red"></a></td>
                <!-- Added delete link -->
            </tr>
            <% } %>

        </table>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Update Batch</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <form action="updateParticipant" method="post">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Name</label>
                        <input type="text" class="pname" name="pname" id="exampleFormControlInput1">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Email</label>
                        <input type="text" class="pemail" name="pemail" id="exampleFormControlInput1">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Phone</label>
                        <input type="text" class="pphone" name="pphone" id="exampleFormControlInput1">
                    </div>
                    <div>
                        <label for="exampleFormControlInput1" class="form-label">Batch</label>
                        <select id="bid" name="bid" class="bid" id="exampleFormControlInput1">
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
                        </select>
                    </div>
                    <br/>
                    <input type="hidden" class="pid" name="pid"/>

                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>

        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script>
    $(".bi-pencil-square").on("click", function () {
        let t = $($(this).parent()).siblings();
        $(".pid").attr("value", t[0].innerText);
        $(".pname").attr("value", t[1].innerText);
        $(".pemail").attr("value", t[2].innerText);
        $(".pphone").attr("value", t[3].innerText);
        $(".bid").attr("value", t[4].innerText);
    });
</script>
</body>
</html>
