<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.User"%>
<%
User loggedUser = (User) session.getAttribute("user");
String userName = (loggedUser != null) ? loggedUser.getName() : "Student";
String userInitial = userName.length() > 0 ? String.valueOf(userName.charAt(0)).toUpperCase() : "S";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Start Quiz — QuizPortal</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>

	<!-- ── Navbar ──────────────────────────────────────── -->
	<nav class="app-navbar">
		<a href="userDashboard.jsp" class="brand">
			<div class="brand-icon-sm">
				<i class="bi bi-mortarboard-fill"></i>
			</div> QuizPortal
		</a>
		<div class="ms-auto d-flex align-items-center gap-3">
			<span class="badge-user">STUDENT</span> <a href="../logout"
				class="navbar-user-pill text-decoration-none">
				<div class="user-avatar"><%=userInitial%></div> <span
				class="user-name"><%=userName%></span> <i
				class="bi bi-box-arrow-right ms-1"
				style="color: var(--gray-500); font-size: .85rem;"></i>
			</a>
		</div>
	</nav>

	<!-- ── Sidebar ──────────────────────────────────────── -->
	<aside class="sidebar">
		<div class="sidebar-section-label">Main</div>
		<a href="userDashboard.jsp" class="sidebar-link"> <i
			class="bi bi-grid-1x2"></i> Dashboard
		</a> <a href="startQuiz.jsp" class="sidebar-link active"> <i
			class="bi bi-play-circle"></i> Take Quiz
		</a>
		<div class="sidebar-section-label">Account</div>
		<a href="../logout" class="sidebar-link"> <i
			class="bi bi-box-arrow-right"></i> Logout
		</a>
	</aside>

	<!-- ── Main Content ─────────────────────────────────── -->
	<main class="main-content">

		<div class="quiz-start-card">

			<!-- Header -->
			<div class="quiz-start-header">
				<span class="quiz-icon">🎯</span>
				<h3>Ready to Begin?</h3>
				<p>Answer all questions carefully. Your score will be saved
					automatically.</p>
			</div>

			<!-- Body -->
			<div class="quiz-start-body">

				<div class="info-row">
					<i class="bi bi-question-circle-fill"></i> <span>All
						available questions included</span>
				</div>
				<div class="info-row">
					<i class="bi bi-card-checklist"></i> <span>One attempt per
						session</span>
				</div>
				<div class="info-row">
					<i class="bi bi-trophy-fill"></i> <span>Score saved to your
						record</span>
				</div>
				<div class="info-row">
					<i class="bi bi-check-circle-fill"></i> <span>Select one
						answer per question</span>
				</div>

				<div style="margin-top: 1.75rem;">
					<form action="${pageContext.request.contextPath}/startQuiz"
						method="get">

						<label class="form-label fw-bold mb-2"> Select Category </label> <select
							name="category" class="form-select mb-3" required>
							<option value="Java">Java</option>
							<option value="Python">Python</option>
							<option value="SQL">SQL</option>
							<option value="HTML">HTML</option>
							<option value="CSS">CSS</option>
						</select>

						<!-- Difficulty Dropdown -->
						<label class="form-label fw-bold mb-2"> Select Difficulty
						</label> <select name="difficulty" class="form-select mb-3" required>
							<option value="easy">Easy</option>
							<option value="medium">Medium</option>
							<option value="hard">Hard</option>
						</select>

						<!-- Launch Button -->
						<button type="submit" class="btn-primary-custom">
							<i class="bi bi-play-fill me-1"></i> Launch Quiz
						</button>
					</form>
					<a href="userDashboard.jsp"
						style="display: block; text-align: center; margin-top: .9rem; color: var(--gray-500); font-size: .85rem; font-weight: 600; text-decoration: none;">
						<i class="bi bi-arrow-left me-1"></i> Back to Dashboard
					</a>
				</div>
			</div>
		</div>

	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
