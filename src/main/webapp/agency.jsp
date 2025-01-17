<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Coffee Manager</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="css/agency.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/demo/menu.jsp">Menu</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/demo/coffee">Coffee</a></li>
            <li><a href="/demo/milktea">Milktea</a></li>
            <li><a href="/demo/fruittea">Fruittea</a></li>
            <li class="active"><a href="/demo/agency?name=agency1">Agency</a></li>
            <li><a href="/demo/ingredient">Ingredient</a></li>
        </ul>
        <form class="navbar-form navbar-right" action="/action_page.php">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" />
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
            </div>
        </form>
    </div>
</nav>
<div class="hero-image">
    <div class="hero-text">
        <h1 style="font-size: 50px">The Happy Garden</h1>
        <p>And I'm a Drinker and Thinker</p>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-2">
            <h2>About Me</h2>
            <h5>Photo of me:</h5>
            <div class="fakeimg">Fake Image</div>
            <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
            <h3>List agencies</h3>
            <p>Agencies under your management</p>
            <ul class="nav nav-pills nav-stacked">
                <li class=${agency=="agency1" ?"active":""}><a href="agency?name=agency1">Agency 1</a></li>
                <li class=${agency=="agency2" ?"active":""}><a href="agency?name=agency2">Agency 2</a></li>
                <li class=${agency=="agency3" ?"active":""}><a href="agency?name=agency3">Agency 3</a></li>
                <li class=${agency=="agency4" ?"active":""}><a href="agency?name=agency4">Agency 4</a></li>
                <li class=${agency=="agency5" ?"active":""}><a href="agency?name=agency5">Agency 5</a></li>
            </ul>
            <hr class="hidden-sm hidden-md hidden-lg" />
        </div>
        <div class="col-sm-8">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Employees</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee </span></a>
                            <%--                  <a href="#" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>--%>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>CODE</th>
                        <th>NAME</th>
                        <th>POSITION</th>
                        <th>PAY1H</th>
                        <th>PAYOT</th>
                        <th>ACTIONS</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="x" items="${listAgency}">
                        <tr>
                            <td>${x.id}</td>
                            <td>${x.code}</td>
                            <td>${x.name}</td>
                            <td>${x.position}</td>
                            <td>${x.pay1h}</td>
                            <td>${x.payOT}</td>
                            <td>
                                <a href="loadEmployees?agency=${agency}&eid=${x.id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="delete?agency=${agency}&eid=${x.id}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="add?agency=${agency}" method="post">
                <div class="modal-header">
                    <h4 class="modal-title"><b>Add Employee</b></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label><b>Code</b></label>
                        <input name="code" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label><b>Name</b></label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label><b>Position</b></label>
                        <select name="position" class="form-select" aria-label="Default select example">
                            <option value="Store Manager">Store Manager</option>
                            <option value="Leader">Leader</option>
                            <option value="Staff">Staff</option>
                            <option value="Trainer">Trainer</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><b>Pay1h</b></label>
                        <input name="pay1h" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label><b>PayOT</b></label>
                        <input name="payOT" type="text" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>


</div>
</body>
</html>
