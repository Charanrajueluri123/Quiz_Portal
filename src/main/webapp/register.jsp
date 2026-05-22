<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register — QuizPortal</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="auth-wrapper">

  <!-- ── Brand Panel ─────────────────────────────── -->
  <div class="auth-brand-panel">
    <div class="brand-icon">
      <i class="bi bi-mortarboard-fill"></i>
    </div>
    <h1>Join QuizPortal</h1>
    <p>Create your free account and start testing your knowledge today.</p>

    <div class="stats-row">
      <div class="stat-item">
        <div class="stat-num">Free</div>
        <div class="stat-label">Forever</div>
      </div>
      <div class="stat-item">
        <div class="stat-num">Instant</div>
        <div class="stat-label">Access</div>
      </div>
    </div>
  </div>

  <!-- ── Form Panel ──────────────────────────────── -->
  <div class="auth-form-panel">
    <div class="auth-form-box">

      <h2>Create an account</h2>
      <p class="subtitle">Fill in the details below to get started</p>

      <form action="register" method="post" novalidate>

        <div class="form-group">
          <label class="form-label" for="name">Full Name</label>
          <div class="input-icon-wrap">
            <i class="bi bi-person"></i>
            <input type="text" id="name" name="name"
                   class="form-control" placeholder="Your full name" required>
          </div>
        </div>

        <div class="form-group">
          <label class="form-label" for="email">Email Address</label>
          <div class="input-icon-wrap">
            <i class="bi bi-envelope"></i>
            <input type="email" id="email" name="email"
                   class="form-control" placeholder="you@email.com" required>
          </div>
        </div>

        <div class="form-group">
          <label class="form-label" for="password">Password</label>
          <div class="input-icon-wrap">
            <i class="bi bi-lock"></i>
            <input type="password" id="password" name="password"
                   class="form-control" placeholder="Choose a password" required>
          </div>
        </div>

<!--         <div class="form-group">
          <label class="form-label" for="role">Account Type</label>
          <div class="input-icon-wrap">
            <i class="bi bi-shield-check"></i>
            <select id="role" name="role" class="form-select" style="padding-left:2.4rem;">
              <option value="USER">User — Take Quizzes</option>
              <option value="ADMIN">Admin — Manage Quizzes</option>
            </select>
          </div>
        </div> -->

        <div style="margin-bottom:1.4rem;"></div>

        <button type="submit" class="btn-primary-custom">
          <i class="bi bi-person-plus me-1"></i> Create Account
        </button>

      </form>

      <p style="text-align:center; font-size:.875rem; color:var(--gray-500); margin-top:1.25rem;">
        Already have an account?
        <a href="login.jsp" class="text-link">Sign in instead</a>
      </p>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
