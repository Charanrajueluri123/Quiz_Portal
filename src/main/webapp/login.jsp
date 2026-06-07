<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login — QuizPortal</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<div class="auth-wrapper">

		<!-- ── Brand Panel ─────────────────────────────── -->
		<div class="auth-brand-panel">
			<div class="brand-icon">
				<i class="bi bi-mortarboard-fill"></i>
			</div>
			<h1>QuizPortal</h1>
			<p>Test your knowledge, track your progress, and grow every day.</p>

			<div class="stats-row">
				<div class="stat-item">
					<div class="stat-num">500+</div>
					<div class="stat-label">Questions</div>
				</div>
				<div class="stat-item">
					<div class="stat-num">1K+</div>
					<div class="stat-label">Students</div>
				</div>
				<div class="stat-item">
					<div class="stat-num">98%</div>
					<div class="stat-label">Accuracy</div>
				</div>
			</div>
		</div>

		<!-- ── Form Panel ──────────────────────────────── -->
		<div class="auth-form-panel">
			<div class="auth-form-box">

				<h2>Welcome back 👋</h2>
				<p class="subtitle">Sign in to your QuizPortal account</p>

				<form action="login" method="post" novalidate>

					<div class="form-group">
						<label class="form-label" for="email">Email Address</label>
						<div class="input-icon-wrap">
							<i class="bi bi-envelope"></i> <input type="email" id="email"
								name="email" class="form-control" placeholder="you@email.com"
								required>
						</div>
					</div>

					<div class="form-group">
						<label class="form-label" for="password">Password</label>
						<div class="input-icon-wrap">
							<i class="bi bi-lock"></i> <input type="password" id="password"
								name="password" class="form-control"
								placeholder="Enter your password" required>
						</div>
					</div>

					<div style="margin-bottom: 1.4rem;"></div>
					
					<div class="text-end mb-3">
						<a href="forgotPassword.jsp" class="text-link"> Forgot
							Password? </a>
					</div>

					<button type="submit" class="btn-primary-custom">
						<i class="bi bi-box-arrow-in-right me-1"></i> Sign In
					</button>

					

				</form>

				<div class="divider-or" style="margin-top: 1.5rem;">or</div>

				<p
					style="text-align: center; font-size: .875rem; color: var(--gray-500); margin-top: .75rem;">
					Don't have an account? <a href="register.jsp" class="text-link">Create
						one free</a>
				</p>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
