<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("user");
    String userName = (loggedUser != null) ? loggedUser.getName() : "Admin";
    String userInitial = userName.length() > 0 ? String.valueOf(userName.charAt(0)).toUpperCase() : "A";

    String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Question — QuizPortal</title>

  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

  <link rel="stylesheet" href="../css/style.css">
</head>

<body>

<!-- ── Navbar ──────────────────────────────────────── -->
<nav class="app-navbar">
  <a href="adminDashboard.jsp" class="brand">
    <div class="brand-icon-sm">
      <i class="bi bi-mortarboard-fill"></i>
    </div>
    QuizPortal
  </a>

  <div class="ms-auto d-flex align-items-center gap-3">
    <span class="badge-admin">ADMIN</span>

    <a href="../logout" class="navbar-user-pill text-decoration-none">
      <div class="user-avatar"><%= userInitial %></div>
      <span class="user-name"><%= userName %></span>
      <i class="bi bi-box-arrow-right ms-1"
         style="color:var(--gray-500);font-size:.85rem;"></i>
    </a>
  </div>
</nav>

<!-- ── Sidebar ──────────────────────────────────────── -->
<aside class="sidebar">

  <div class="sidebar-section-label">Main</div>

  <a href="adminDashboard.jsp" class="sidebar-link">
    <i class="bi bi-grid-1x2"></i> Dashboard
  </a>

  <a href="addQuestion.jsp" class="sidebar-link active">
    <i class="bi bi-plus-circle"></i> Add Question
  </a>

  <div class="sidebar-section-label">Account</div>

  <a href="../logout" class="sidebar-link">
    <i class="bi bi-box-arrow-right"></i> Logout
  </a>

</aside>

<!-- ── Main Content ─────────────────────────────────── -->
<main class="main-content">

  <!-- Success Alert -->
  <%
  if("success".equals(msg)){
  %>

  <div class="alert alert-success alert-dismissible fade show shadow-sm"
       role="alert"
       style="max-width:680px;
              border-radius:14px;
              margin-bottom:1rem;">

      <i class="bi bi-check-circle-fill me-2"></i>

      <strong>Success!</strong>
      Question added successfully.

      <button type="button"
              class="btn-close"
              data-bs-dismiss="alert"></button>
  </div>

  <%
  }
  %>

  <!-- Error Alert -->
  <%
  if("error".equals(msg)){
  %>

  <div class="alert alert-danger alert-dismissible fade show shadow-sm"
       role="alert"
       style="max-width:680px;
              border-radius:14px;
              margin-bottom:1rem;">

      <i class="bi bi-x-circle-fill me-2"></i>

      <strong>Error!</strong>
      Failed to add question.

      <button type="button"
              class="btn-close"
              data-bs-dismiss="alert"></button>
  </div>

  <%
  }
  %>

  <div class="page-header">
    <h2>Add New Question</h2>
    <p>
      Fill in the form below to add a new quiz question to the system.
    </p>
  </div>

  <div style="max-width:680px;">

    <div class="card-custom">

      <div class="card-header-custom">

        <h5>
          <i class="bi bi-plus-circle me-2"
             style="color:var(--primary);"></i>

          Question Details
        </h5>

        <a href="adminDashboard.jsp"
           class="btn-outline-custom"
           style="font-size:.8rem; padding:.4rem .9rem;">

          <i class="bi bi-arrow-left"></i> Back
        </a>

      </div>

      <div class="card-body-custom">

        <form action="../addQuestion" method="post" novalidate>

          <!-- Question -->
          <div class="form-group">

            <label class="form-label" for="question">
              Question Text
            </label>

            <textarea id="question"
                      name="question"
                      class="form-control"
                      rows="3"
                      placeholder="Type your question here..."
                      required
                      style="resize:vertical;"></textarea>

          </div>

          <!-- Options -->
          <div class="row g-3" style="margin-bottom:1rem;">

            <!-- Option A -->
            <div class="col-sm-6">

              <div class="form-group" style="margin-bottom:0;">

                <label class="form-label" for="opt1">

                  <span style="display:inline-flex;
                               align-items:center;
                               justify-content:center;
                               width:20px;
                               height:20px;
                               background:var(--primary-light);
                               color:var(--primary);
                               border-radius:50%;
                               font-size:.72rem;
                               font-weight:800;
                               margin-right:.4rem;">A</span>

                  Option 1
                </label>

                <input type="text"
                       id="opt1"
                       name="option1"
                       class="form-control"
                       placeholder="Option A"
                       required>

              </div>
            </div>

            <!-- Option B -->
            <div class="col-sm-6">

              <div class="form-group" style="margin-bottom:0;">

                <label class="form-label" for="opt2">

                  <span style="display:inline-flex;
                               align-items:center;
                               justify-content:center;
                               width:20px;
                               height:20px;
                               background:#f5f3ff;
                               color:var(--secondary);
                               border-radius:50%;
                               font-size:.72rem;
                               font-weight:800;
                               margin-right:.4rem;">B</span>

                  Option 2
                </label>

                <input type="text"
                       id="opt2"
                       name="option2"
                       class="form-control"
                       placeholder="Option B"
                       required>

              </div>
            </div>

            <!-- Option C -->
            <div class="col-sm-6">

              <div class="form-group" style="margin-bottom:0;">

                <label class="form-label" for="opt3">

                  <span style="display:inline-flex;
                               align-items:center;
                               justify-content:center;
                               width:20px;
                               height:20px;
                               background:#f0fdf4;
                               color:var(--success);
                               border-radius:50%;
                               font-size:.72rem;
                               font-weight:800;
                               margin-right:.4rem;">C</span>

                  Option 3
                </label>

                <input type="text"
                       id="opt3"
                       name="option3"
                       class="form-control"
                       placeholder="Option C"
                       required>

              </div>
            </div>

            <!-- Option D -->
            <div class="col-sm-6">

              <div class="form-group" style="margin-bottom:0;">

                <label class="form-label" for="opt4">

                  <span style="display:inline-flex;
                               align-items:center;
                               justify-content:center;
                               width:20px;
                               height:20px;
                               background:#fffbeb;
                               color:var(--warning);
                               border-radius:50%;
                               font-size:.72rem;
                               font-weight:800;
                               margin-right:.4rem;">D</span>

                  Option 4
                </label>

                <input type="text"
                       id="opt4"
                       name="option4"
                       class="form-control"
                       placeholder="Option D"
                       required>

              </div>
            </div>

          </div>

          <!-- Correct Answer -->
          <div class="form-group">

            <label class="form-label" for="correctAnswer">

              <i class="bi bi-check-circle-fill me-1"
                 style="color:var(--success);"></i>

              Correct Answer
            </label>

            <input type="text"
                   id="correctAnswer"
                   name="correctAnswer"
                   class="form-control"
                   placeholder="Type the exact text of the correct option"
                   required>

            <small style="color:var(--gray-500);
                          font-size:.78rem;
                          margin-top:.3rem;
                          display:block;">

              Must exactly match one of the option texts above.
            </small>

          </div>

          <!-- Submit Button -->
          <div style="padding-top:.5rem;">

            <button type="submit"
                    class="btn-primary-custom"
                    style="width:auto; padding:.7rem 2rem;">

              <i class="bi bi-plus-circle me-1"></i>
              Add Question
            </button>

          </div>

        </form>

      </div>
    </div>
  </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>