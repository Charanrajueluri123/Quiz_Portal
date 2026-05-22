<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.User" %>
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
  <title>Dashboard — QuizPortal</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<!-- ── Navbar ──────────────────────────────────────── -->
<nav class="app-navbar">
  <a href="userDashboard.jsp" class="brand">
    <div class="brand-icon-sm"><i class="bi bi-mortarboard-fill"></i></div>
    QuizPortal
  </a>
  <div class="ms-auto d-flex align-items-center gap-3">
    <span class="badge-user">STUDENT</span>
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
  <a href="userDashboard.jsp" class="sidebar-link active">
    <i class="bi bi-grid-1x2"></i> Dashboard
  </a>
  <a href="startQuiz.jsp" class="sidebar-link">
    <i class="bi bi-play-circle"></i> Take Quiz
  </a>
  <div class="sidebar-section-label">Account</div>
  <a href="../logout" class="sidebar-link">
    <i class="bi bi-box-arrow-right"></i> Logout
  </a>
</aside>

<!-- ── Main Content ─────────────────────────────────── -->
<main class="main-content">

  <!-- Welcome Header -->
  <div class="page-header">
    <h2>Hello, <%= userName %> 👋</h2>
    <p>Ready to challenge yourself? Jump into a quiz and track your progress.</p>
  </div>

  <!-- Stat Cards -->
  <div class="row g-3 mb-4">
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card blue">
        <div class="stat-icon blue"><i class="bi bi-play-circle"></i></div>
        <div class="stat-body">
          <div class="stat-label">Quizzes Taken</div>
          <div class="stat-value"><%= session.getAttribute("totalAttempts") %></div>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card green">
        <div class="stat-icon green"><i class="bi bi-trophy"></i></div>
        <div class="stat-body">
          <div class="stat-label">Best Score</div>
          <div class="stat-value"><%= session.getAttribute("bestScore") %>	</div>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card purple">
        <div class="stat-icon purple"><i class="bi bi-bar-chart"></i></div>
        <div class="stat-body">
          <div class="stat-label">Avg Score</div>
          <div class="stat-value"><%= session.getAttribute("avgScore") %></div>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card orange">
        <div class="stat-icon orange"><i class="bi bi-question-circle"></i></div>
        <div class="stat-body">
          <div class="stat-label">Questions</div>
          <div class="stat-value"><%= session.getAttribute("totalQuestions") %></div>
        </div>
      </div>
    </div>
  </div>

  <!-- CTA Banner -->
  <div class="row g-3 mb-4">
    <div class="col-12">
      <div style="background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
                  border-radius: var(--radius-lg); padding: 2rem 2.5rem;
                  display: flex; align-items: center; justify-content: space-between;
                  flex-wrap: wrap; gap: 1rem;">
        <div>
          <div style="font-family:var(--font-head); font-size:1.2rem; font-weight:700; color:white; margin-bottom:.4rem;">
            <i class="bi bi-lightning-charge-fill me-2"></i>Ready for today's quiz?
          </div>
          <div style="color:rgba(255,255,255,.8); font-size:.875rem;">
            Test your knowledge and see how you rank!
          </div>
        </div>
        <a href="startQuiz.jsp"
           style="background:white; color:var(--primary); border-radius:var(--radius);
                  padding:.7rem 1.8rem; font-weight:700; font-size:.9rem;
                  text-decoration:none; font-family:var(--font-body);
                  display:inline-flex; align-items:center; gap:.5rem;
                  box-shadow: 0 4px 14px rgba(0,0,0,.2); transition:var(--transition);"
           onmouseover="this.style.transform='translateY(-2px)'"
           onmouseout="this.style.transform='none'">
          <i class="bi bi-play-fill"></i> Start Quiz
        </a>
      </div>
    </div>
  </div>

  <!-- Quick Links -->
  <div class="row g-3">
    <div class="col-12">
      <div class="card-custom">
        <div class="card-header-custom">
          <h5><i class="bi bi-compass me-2" style="color:var(--primary);"></i>Quick Links</h5>
        </div>
        <div class="card-body-custom">
          <div class="row g-3">
            <div class="col-md-4">
              <a href="startQuiz.jsp" class="action-card">
                <div class="action-icon" style="background:#eff6ff;color:var(--primary);">
                  <i class="bi bi-play-circle-fill"></i>
                </div>
                <div>
                  <div class="action-title">Start Quiz</div>
                  <div class="action-desc">Begin a new quiz session</div>
                </div>
              </a>
            </div>
            <div class="col-md-4">
              <a href="../logout" class="action-card">
                <div class="action-icon" style="background:#fef2f2;color:var(--danger);">
                  <i class="bi bi-box-arrow-right"></i>
                </div>
                <div>
                  <div class="action-title">Logout</div>
                  <div class="action-desc">End your session safely</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
