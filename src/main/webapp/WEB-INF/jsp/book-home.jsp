<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Hello Student</title>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
	<script src="/js/jquery-3.6.0.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="font/bootstrap-icons.css">	
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Books</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/newBook">New Book</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

	<div class="container">
	<c:choose>
		<c:when test="${mode == 'BOOK_VIEW'}">
		    <i class="bi bi-alarm-fill"></i>
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
							<td><fmt:formatDate pattern="dd/MM/yyyy" value="${book.purchaseDate}" /></td>
							<td><a href="updateBook?id=${book.id}"><i class="bi bi-pencil"></i></a></td>
							<td><a href="deleteBook?id=${book.id}"><i class="bi bi-trash"></i></a></td>
							
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
					<input type="date" class="form-control" value="<fmt:formatDate value="${book.purchaseDate}" pattern="yyyy-MM-dd" />" name="purchaseDate" id="purchaseDate">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</c:when>
	</c:choose>
	</div>
</body>
</html>