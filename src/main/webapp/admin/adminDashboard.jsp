<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.quiz.model.User"%>

<%
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

<title>Admin Dashboard</title>

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

	<a href="adminDashboard.jsp"
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

		<a href="../logout"
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

	<a href="adminDashboard.jsp"
		class="sidebar-link active">

		<i class="bi bi-grid-1x2"></i>
		Dashboard

	</a>

	

	<a href="../viewQuestions"
		class="sidebar-link">

		<i class="bi bi-pencil-square"></i>
		Manage Questions

	</a>

	<div class="sidebar-section-label">Account</div>

		<a href="../logout" class="sidebar-link"> <i
			class="bi bi-box-arrow-right"></i> Logout
		</a>

</aside>

<!-- MAIN -->

<main class="main-content">

	<div class="page-header">

		<h2>
			Admin Dashboard
		</h2>

		<p>
			Welcome back
			<strong>
				<%= userName %>
			</strong>
		</p>

	</div>

	<div class="row g-3">

		<div class="col-md-4">

			<a href="addQuestion.jsp"
				class="action-card">

				<div class="action-icon"
					style="background:#eff6ff;
					color:#2563eb;">

					<i class="bi bi-plus-circle-fill"></i>

				</div>

				<div>

					<div class="action-title">
						Add Question
					</div>

					<div class="action-desc">
						Create new question
					</div>

				</div>

			</a>

		</div>

		<div class="col-md-4">

			<a href="../viewQuestions"
				class="action-card">

				<div class="action-icon"
					style="background:#ecfeff;
					color:#0891b2;">

					<i class="bi bi-pencil-square"></i>

				</div>

				<div>

					<div class="action-title">
						Manage Questions
					</div>

					<div class="action-desc">
						Edit/Delete questions
					</div>

				</div>

			</a>

		</div>

	</div>

</main>

</body>

</html>