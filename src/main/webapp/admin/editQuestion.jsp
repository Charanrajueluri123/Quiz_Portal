<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.quiz.model.Question"%>
<%@ page import="com.quiz.model.User"%>

<%
Question q = (Question) request.getAttribute("question");

User loggedUser = (User) session.getAttribute("user");

String userName =
(loggedUser != null)
? loggedUser.getName()
: "Admin";

String userInitial =
userName.length() > 0
? String.valueOf(userName.charAt(0)).toUpperCase()
: "A";
%>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0">

<title>Edit Question</title>

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

		</div>

		QuizPortal

	</a>

	<div class="ms-auto d-flex align-items-center gap-3">

		<span class="badge-admin">
			ADMIN
		</span>

		<a href="${pageContext.request.contextPath}/logout"
			class="navbar-user-pill text-decoration-none">

			<div class="user-avatar">
				<%= userInitial %>
			</div>

			<span class="user-name">
				<%= userName %>
			</span>

		</a>

	</div>

</nav>

<!-- SIDEBAR -->

<aside class="sidebar">

	<div class="sidebar-section-label">
		Main
	</div>

	<a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp"
		class="sidebar-link">

		<i class="bi bi-grid-1x2"></i>
		Dashboard

	</a>

	<a href="${pageContext.request.contextPath}/viewQuestions"
		class="sidebar-link active">

		<i class="bi bi-pencil-square"></i>
		Manage Questions

	</a>

	<a href="${pageContext.request.contextPath}/logout"
		class="sidebar-link">

		<i class="bi bi-box-arrow-right"></i>
		Logout

	</a>

</aside>

<!-- MAIN CONTENT -->

<main class="main-content">

	<div class="page-header">

		<h2>
			Edit Question
		</h2>

		<p>
			Update question details
		</p>

	</div>

	<div class="card-custom">

		<div class="card-body-custom">

			<form action="${pageContext.request.contextPath}/updateQuestion"
				method="post">

				<input type="hidden"
					name="id"
					value="<%= q.getId() %>">

				<div class="mb-3">

					<label class="form-label">
						Question
					</label>

					<input type="text"
						name="question"
						class="form-control"
						value="<%= q.getQuestion() %>">

				</div>

				<div class="mb-3">

					<label class="form-label">
						Option 1
					</label>

					<input type="text"
						name="option1"
						class="form-control"
						value="<%= q.getOption1() %>">

				</div>

				<div class="mb-3">

					<label class="form-label">
						Option 2
					</label>

					<input type="text"
						name="option2"
						class="form-control"
						value="<%= q.getOption2() %>">

				</div>

				<div class="mb-3">

					<label class="form-label">
						Option 3
					</label>

					<input type="text"
						name="option3"
						class="form-control"
						value="<%= q.getOption3() %>">

				</div>

				<div class="mb-3">

					<label class="form-label">
						Option 4
					</label>

					<input type="text"
						name="option4"
						class="form-control"
						value="<%= q.getOption4() %>">

				</div>

				<div class="mb-3">

					<label class="form-label">
						Correct Answer
					</label>

					<input type="text"
						name="correctAnswer"
						class="form-control"
						value="<%= q.getCorrectAnswer() %>">

				</div>

				<button type="submit"
					class="btn btn-primary">

					Update Question

				</button>

			</form>

		</div>

	</div>

</main>

</body>

</html>