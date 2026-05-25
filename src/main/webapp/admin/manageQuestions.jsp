<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.quiz.model.Question"%>
<%@ page import="com.quiz.model.User"%>

<%
User loggedUser = (User) session.getAttribute("user");

String userName = (loggedUser != null) ? loggedUser.getName() : "Admin";

String userInitial = userName.length() > 0 ? String.valueOf(userName.charAt(0)).toUpperCase() : "A";

List<Question> questions = (List<Question>) request.getAttribute("questions");
%>



<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Manage Questions</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

	<!-- NAVBAR -->
	<nav class="app-navbar">

		<a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp"
			class="brand">

			<div class="brand-icon-sm">
				<i class="bi bi-mortarboard-fill"></i>
			</div> QuizPortal

		</a>

		<div class="ms-auto d-flex align-items-center gap-3">

			<span class="badge-admin">ADMIN</span> <a
				href="${pageContext.request.contextPath}/logout"
				class="navbar-user-pill text-decoration-none">

				<div class="user-avatar">
					<%=userInitial%>
				</div> <span class="user-name"><%=userName%></span>

			</a>

		</div>

	</nav>

	<!-- SIDEBAR -->
	<aside class="sidebar">

		<div class="sidebar-section-label">Main</div>

		<a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp"
			class="sidebar-link"> <i class="bi bi-grid-1x2"></i> Dashboard
		</a> <a href="${pageContext.request.contextPath}/viewQuestions"
			class="sidebar-link active"> <i class="bi bi-pencil-square"></i>
			Manage Questions
		</a>

		<div class="sidebar-section-label">Account</div>

		<a href="${pageContext.request.contextPath}/logout"
			class="sidebar-link"> <i class="bi bi-box-arrow-right"></i>
			Logout
		</a>

	</aside>

	<!-- MAIN -->
	<main class="main-content">

		<div class="page-header">
			<h2>Manage Questions</h2>
			<p>Search, edit, delete questions easily</p>
		</div>

		<%
		String msg = (String) session.getAttribute("msg");
		if (msg != null) {
		%>

		<div class="alert alert-success alert-dismissible fade show"
			role="alert">
			<%=msg%>

			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>

		<%
		session.removeAttribute("msg");
		}
		%>

		<!-- SEARCH BOX -->
		<div class="mb-3">
			<input type="text" id="searchInput" class="form-control"
				placeholder="Search by Question ID...">
		</div>

		<div class="card-custom">

			<div class="card-body-custom table-responsive">

				<table class="table table-hover">

					<thead class="table-dark">

						<tr>
							<th>ID</th>
							<th>Question</th>
							<th>Category</th>
							<th>Difficulty</th>
							<th>Actions</th>
						</tr>

					</thead>

					<tbody id="questionTable">

						<%
						if (questions != null) {
							for (Question q : questions) {
						%>

						<tr>
							<td class="qid"><%=q.getId()%></td>
							<td><%=q.getQuestion()%></td>
							<td><%=q.getCategory()%></td>
							<td><%=q.getDifficulty()%></td>

							<td><a
								href="${pageContext.request.contextPath}/editQuestion?id=<%=q.getId()%>"
								class="btn btn-primary btn-sm">Edit</a> <a
								href="${pageContext.request.contextPath}/deleteQuestion?id=<%=q.getId()%>"
								class="btn btn-danger btn-sm">Delete</a></td>

						</tr>

						<%
						}
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

		<!-- PAGINATION -->
		<div class="mt-3 d-flex justify-content-center">
			<button class="btn btn-outline-primary me-2" onclick="prevPage()">Prev</button>
			<span id="pageInfo" class="align-self-center"></span>
			<button class="btn btn-outline-primary ms-2" onclick="nextPage()">Next</button>
		</div>

	</main>

	<!-- SCRIPT -->
	<!-- SCRIPT -->

<script>

let currentPage = 1;
const rowsPerPage = 10;

const table = document.getElementById("questionTable");
const rows = table.getElementsByTagName("tr");

const searchInput = document.getElementById("searchInput");

function showPage(page) {

	let visibleRows = [];

	// filter rows by search
	let searchValue = searchInput.value.trim();

	for (let i = 0; i < rows.length; i++) {

		let id =
		rows[i].querySelector(".qid").innerText;

		if (searchValue === "" || id.includes(searchValue)) {
			visibleRows.push(rows[i]);
		}
	}

	// hide all rows
	for (let r of rows) {
		r.style.display = "none";
	}

	let start = (page - 1) * rowsPerPage;
	let end = start + rowsPerPage;

	for (let i = start;
		i < end && i < visibleRows.length;
		i++) {

		visibleRows[i].style.display = "";
	}

	document.getElementById("pageInfo").innerText =
		"Page " + page + " of " +
		Math.ceil(visibleRows.length / rowsPerPage);
}

function nextPage() {

	let totalVisibleRows = [];

	let searchValue =
	searchInput.value.trim();

	for (let i = 0; i < rows.length; i++) {

		let id =
		rows[i].querySelector(".qid").innerText;

		if (searchValue === "" || id.includes(searchValue)) {
			totalVisibleRows.push(rows[i]);
		}
	}

	let totalPages =
	Math.ceil(totalVisibleRows.length / rowsPerPage);

	if (currentPage < totalPages) {
		currentPage++;
		showPage(currentPage);
	}
}

function prevPage() {

	if (currentPage > 1) {
		currentPage--;
		showPage(currentPage);
	}
}

searchInput.addEventListener("keyup", function () {

	currentPage = 1;
	showPage(currentPage);
});

window.onload = function () {

	showPage(currentPage);

	// auto close success alert

	setTimeout(() => {

		let alertBox =
		document.querySelector(".alert");

		if (alertBox) {

			let bsAlert =
			new bootstrap.Alert(alertBox);

			bsAlert.close();
		}

	}, 3000);
};

</script>

<!-- Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>