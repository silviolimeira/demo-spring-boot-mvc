<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Hello Student</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="newBook">New Book</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

	<div class="container">
	<c:choose>
		<c:when test="${mode == 'BOOK_VIEW'}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Book Name</th>
						<th>Author</th>
						<th>Purchase Date</th>
						<th>Edit</th>
						<th>Delete</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${books}">
						<tr>
							<td>${book.id}</td>
							<td>${book.bookName}</td>
							<td>${book.author}</td>
							<td>${book.purchaseDate}</td>
							<td><a href="updateBook?id=${book.id}"><span class="glyphicon glyphicon-pencil">E</span></a></td>
							<td><a href="deleteBook?id=${book.id}"><span class="glyphicon glyphicon-trash">E</span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		
		<c:when test="${mode == 'BOOK_EDIT' || mode == 'BOOK_NEW'}">
			<form action="saveBook" method="post">
				<input type="hidden" class="form-control" value="${book.id}" name="id" id="id">
				<div class="form-group">
					<label for="bookName">Book Name</label>
					<input type="text" class="form-control" value="${book.bookName}" name="bookName" id="bookName">
				</div>
				<div class="form-group">
					<label for="author">Author</label>
					<input type="text" class="form-control" value="${book.author}" name="author" id="author">
				</div>
				<div class="form-group">
					<label for="purchaseDate">Purchase Date</label>
					<input type="date" class="form-control" value="${book.purchaseDate}" name="purchaseDate" id="purchaseDate">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</c:when>
	</c:choose>
	</div>
</body>
</html>