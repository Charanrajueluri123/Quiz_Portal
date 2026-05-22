<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.User" %>
<%
    User loggedUser = (User) session.getAttribute("user");
    String userName = (loggedUser != null) ? loggedUser.getName() : "Admin";
    String userInitial = userName.length() > 0 ? String.valueOf(userName.charAt(0)).toUpperCase() : "A";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard — QuizPortal</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<!-- ── Navbar ──────────────────────────────────────── -->
<nav class="app-navbar">
  <a href="adminDashboard.jsp" class="brand">
    <div class="brand-icon-sm"><i class="bi bi-mortarboard-fill"></i></div>
    QuizPortal
  </a>

  <div class="ms-auto d-flex align-items-center gap-3">
    <span class="badge-admin">ADMIN</span>
    <a href="../logout" class="navbar-user-pill text-decoration-none">
      <div class="user-avatar"><%= userInitial %></div>
      <span class="user-name"><%= userName %></span>
      <i class="bi bi-box-arrow-right ms-1" style="color:var(--gray-500);font-size:.85rem;"></i>
    </a>
  </div>
</nav>

<!-- ── Sidebar ──────────────────────────────────────── -->
<aside class="sidebar">
  <div class="sidebar-section-label">Main</div>
  <a href="adminDashboard.jsp" class="sidebar-link active">
    <i class="bi bi-grid-1x2"></i> Dashboard
  </a>
  <a href="addQuestion.jsp" class="sidebar-link">
    <i class="bi bi-plus-circle"></i> Add Question
  </a>

  <div class="sidebar-section-label">Account</div>
  <a href="../logout" class="sidebar-link">
    <i class="bi bi-box-arrow-right"></i> Logout
  </a>
</aside>

<!-- ── Main Content ─────────────────────────────────── -->
<main class="main-content">

  <!-- Page Header -->
  <div class="page-header">
    <h2>Admin Dashboard</h2>
    <p>Welcome back, <strong><%= userName %></strong>! Manage your quiz system from here.</p>
  </div>

  <!-- Stat Cards -->
  <div class="row g-3 mb-4">
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card blue">
        <div class="stat-icon blue"><i class="bi bi-question-circle"></i></div>
        <div class="stat-body">
          <div class="stat-label">Total Questions</div>
          <div class="stat-value"><%= session.getAttribute("totalQuestions") %></div>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card purple">
        <div class="stat-icon purple"><i class="bi bi-people"></i></div>
        <div class="stat-body">
          <div class="stat-label">Registered Users</div>
          <div class="stat-value"><%= session.getAttribute("totalUsers") %></div>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card green">
        <div class="stat-icon green"><i class="bi bi-check2-circle"></i></div>
        <div class="stat-body">
          <div class="stat-label">Quizzes Taken</div>
          <div class="stat-value"><%= session.getAttribute("totalAttempts") %></div>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card orange">
        <div class="stat-icon orange"><i class="bi bi-graph-up"></i></div>
        <div class="stat-body">
          <div class="stat-label">Avg Score</div>
          <div class="stat-value"><%= session.getAttribute("avgScore") %></div>
        </div>
      </div>
    </div>
  </div>

  <!-- Quick Actions -->
  <div class="row g-3 mb-4">
    <div class="col-12">
      <div class="card-custom">
        <div class="card-header-custom">
          <h5><i class="bi bi-lightning-charge me-2" style="color:var(--warning);"></i>Quick Actions</h5>
        </div>
        <div class="card-body-custom">
          <div class="row g-3">
            <div class="col-md-4">
              <a href="addQuestion.jsp" class="action-card">
                <div class="action-icon" style="background:#eff6ff; color:var(--primary);">
                  <i class="bi bi-plus-circle-fill"></i>
                </div>
                <div>
                  <div class="action-title">Add Question</div>
                  <div class="action-desc">Create a new quiz question</div>
                </div>
              </a>
            </div>
            <div class="col-md-4">
              <a href="../logout" class="action-card">
                <div class="action-icon" style="background:#fef2f2; color:var(--danger);">
                  <i class="bi bi-box-arrow-right"></i>
                </div>
                <div>
                  <div class="action-title">Logout</div>
                  <div class="action-desc">End your current session</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Info Banner -->
  <div class="card-custom">
    <div class="card-body-custom" style="display:flex; align-items:center; gap:1rem;">
      <div style="width:44px;height:44px;border-radius:12px;background:#eff6ff;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
        <i class="bi bi-info-circle" style="color:var(--primary);font-size:1.2rem;"></i>
      </div>
      <div>
        <div style="font-family:var(--font-head);font-weight:700;color:var(--dark);font-size:.9rem;">
          Admin Access Active
        </div>
        <div style="color:var(--gray-500);font-size:.82rem;">
          You are logged in as an administrator. Use the sidebar to navigate and manage the quiz system.
        </div>
      </div>
    </div>
  </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
