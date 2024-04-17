<%@page import="org.example.gymmanagement.model.Batch" %>
<%@page import="org.example.gymmanagement.helper.DBUtil" %>
<%@page import="org.example.gymmanagement.dao.BatchDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
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
<h1 class="m-4">Update Batch</h1>
<div class="row">
    <div class="col-10 offset-1">
        <table class="table table-striped">
            <tr>
                <th>Bid</th>
                <th>Bname</th>
                <th>Edit</th>
                <th>Delete</th> <!-- Added delete column -->
            </tr>
            <%
                BatchDao bd = new BatchDao(new DBUtil());
                List<Batch> v = bd.getBatch();
                Iterator<Batch> it = v.iterator();
                while (it.hasNext()) {
                    Batch b = it.next();
            %>
            <tr>
                <td><%= b.getBid() %>
                </td>
                <td><%= b.getbName()%>
                </td>
                <td><i class="bi bi-pencil-square" style="color:green" data-bs-toggle="modal"
                       data-bs-target="#exampleModal"></i></td>
                <td><a href="deleteBatch?bid=<%= b.getBid() %>" class="bi bi-trash" style="color:red"></a></td>
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
                <form action="updateBatch" method="post">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">Batch Name</label>
                        <input type="text" class="bname" name="bname" id="exampleFormControlInput1"
                               placeholder="Morning">
                    </div>
                    <input type="hidden" class="bid" name="bid"/>

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
        $(".bid").attr("value", t[0].innerText);
        $(".bname").attr("value", t[1].innerText);
    });
</script>
</body>
</html>
