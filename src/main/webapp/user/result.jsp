<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.User" %>

<%
    User loggedUser = (User) session.getAttribute("user");

    String userName = (loggedUser != null)
            ? loggedUser.getName()
            : "Student";

    String userInitial = userName.length() > 0
            ? String.valueOf(userName.charAt(0)).toUpperCase()
            : "S";

    Object scoreObj = request.getAttribute("score");

    int score = (scoreObj != null)
            ? (Integer) scoreObj
            : 0;

    String badgeClass, badgeEmoji, badgeText, resultMsg, scoreColor;

    if (score >= 8) {

        badgeClass = "excellent";
        badgeEmoji = "🏆";
        badgeText = "Excellent Work!";
        resultMsg = "Outstanding performance. You answered most questions correctly.";
        scoreColor = "#16a34a";

    } else if (score >= 5) {

        badgeClass = "good";
        badgeEmoji = "⭐";
        badgeText = "Good Job!";
        resultMsg = "Nice effort. You're improving well, keep practicing.";
        scoreColor = "#f59e0b";

    } else {

        badgeClass = "retry";
        badgeEmoji = "📚";
        badgeText = "Keep Practicing!";
        resultMsg = "Don't worry. Review the concepts and try the quiz again.";
        scoreColor = "#ef4444";
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Quiz Result - QuizPortal</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

:root{

    --primary:#2563eb;
    --bg:#f1f5f9;
    --white:#ffffff;
    --dark:#0f172a;
    --gray:#64748b;
    --border:#e2e8f0;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Inter,sans-serif;
    background:var(--bg);
    color:var(--dark);
}

/* NAVBAR */

.app-navbar{

    height:70px;

    background:white;

    display:flex;

    align-items:center;

    justify-content:space-between;

    padding:0 24px;

    border-bottom:1px solid var(--border);
}

.brand{

    text-decoration:none;

    color:var(--dark);

    font-size:1.4rem;

    font-weight:700;

    display:flex;

    align-items:center;

    gap:10px;
}

.brand-icon{

    width:40px;
    height:40px;

    border-radius:12px;

    background:linear-gradient(135deg,#2563eb,#4f46e5);

    display:flex;

    align-items:center;

    justify-content:center;

    color:white;

    font-size:1.1rem;
}

.nav-right{

    display:flex;

    align-items:center;

    gap:14px;
}

.student-badge{

    background:#dbeafe;

    color:#2563eb;

    padding:6px 12px;

    border-radius:999px;

    font-size:.75rem;

    font-weight:700;
}

.user-pill{

    background:#f8fafc;

    padding:6px 12px;

    border-radius:999px;

    display:flex;

    align-items:center;

    gap:10px;
}

.avatar{

    width:34px;
    height:34px;

    border-radius:50%;

    background:linear-gradient(135deg,#2563eb,#7c3aed);

    color:white;

    font-weight:700;

    display:flex;

    align-items:center;

    justify-content:center;
}

/* MAIN */

.main-wrapper{

    display:flex;

    justify-content:center;

    padding:12px 20px 20px;
}

/* RESULT CARD */

.result-card{

    width:100%;

    max-width:560px;

    background:white;

    border-radius:24px;

    overflow:hidden;

    box-shadow:0 6px 25px rgba(0,0,0,.07);
}

/* TOP SECTION */

.result-top{

    padding:20px 20px 60px;

    text-align:center;

    color:white;

    background:linear-gradient(135deg,#2563eb,#7c3aed);
}

.emoji{

    font-size:2.5rem;

    margin-bottom:8px;
}

.result-top h1{

    font-size:1.7rem;

    font-weight:800;

    margin-bottom:6px;
}

.result-top p{

    opacity:.95;

    font-size:.92rem;

    line-height:1.5;

    margin:0;
}

/* SCORE SECTION */

.score-section{

    display:flex;

    justify-content:center;

    margin-top:-42px;

    position:relative;

    z-index:10;
}

.score-circle{

    width:82px;
    height:82px;

    border-radius:50%;

    background:white;

    border:6px solid <%= scoreColor %>;

    display:flex;

    flex-direction:column;

    align-items:center;

    justify-content:center;

    box-shadow:0 5px 18px rgba(0,0,0,.08);
}

.score-number{

    font-size:1.4rem;

    font-weight:800;

    color:<%= scoreColor %>;
}

.score-label{

    color:var(--gray);

    font-weight:600;

    font-size:.75rem;
}

/* BODY */

.result-body{

    padding:16px 18px 18px;
}

/* STATUS */

.status-wrap{

    text-align:center;

    margin-bottom:18px;
}

.status-badge{

    display:inline-flex;

    align-items:center;

    gap:6px;

    padding:6px 12px;

    border-radius:999px;

    font-size:.78rem;

    font-weight:700;
}

.status-badge.excellent{

    background:#dcfce7;

    color:#15803d;
}

.status-badge.good{

    background:#fef3c7;

    color:#b45309;
}

.status-badge.retry{

    background:#fee2e2;

    color:#b91c1c;
}

/* SUMMARY */

.summary-box{

    border:1px solid var(--border);

    border-radius:16px;

    overflow:hidden;

    margin-bottom:18px;
}

.summary-header{

    background:#f8fafc;

    padding:10px 14px;

    font-size:1rem;

    font-weight:700;

    border-bottom:1px solid var(--border);
}

.summary-item{

    padding:10px 14px;

    display:flex;

    justify-content:space-between;

    border-bottom:1px solid var(--border);
}

.summary-item:last-child{

    border-bottom:none;
}

.summary-label{

    color:var(--gray);

    font-weight:600;
}

.summary-value{

    font-weight:700;
}

/* BUTTONS */

.action-buttons{

    display:flex;

    gap:12px;

    margin-top:18px;
}

.btn-custom{

    flex:1;

    border:none;

    border-radius:12px;

    padding:10px;

    font-weight:700;

    font-size:.9rem;

    text-decoration:none;

    display:flex;

    align-items:center;

    justify-content:center;

    gap:8px;

    transition:.25s;
}

.btn-primary-custom{

    background:linear-gradient(135deg,#2563eb,#4f46e5);

    color:white;
}

.btn-primary-custom:hover{

    opacity:.95;
}

.btn-outline-custom{

    background:white;

    color:#2563eb;

    border:2px solid #dbeafe;
}

.btn-outline-custom:hover{

    background:#eff6ff;
}

/* MOBILE */

@media(max-width:768px){

    .app-navbar{

        padding:0 14px;
    }

    .student-badge{

        display:none;
    }

    .action-buttons{

        flex-direction:column;
    }

    .summary-item{

        flex-direction:column;

        gap:4px;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="app-navbar">

    <a href="${pageContext.request.contextPath}/user/userDashboard.jsp" class="brand">

        <div class="brand-icon">
            🎓
        </div>

        QuizPortal

    </a>

    <div class="nav-right">

        <span class="student-badge">
            STUDENT
        </span>

        <div class="user-pill">

            <div class="avatar">
                <%= userInitial %>
            </div>

            <span>
                <%= userName %>
            </span>

        </div>

    </div>

</nav>

<!-- MAIN -->

<div class="main-wrapper">

    <div class="result-card">

        <!-- TOP -->

        <div class="result-top">

            <div class="emoji">
                <%= badgeEmoji %>
            </div>

            <h1>
                Quiz Completed
            </h1>

            <p>
                <%= resultMsg %>
            </p>

        </div>

        <!-- SCORE -->

        <div class="score-section">

            <div class="score-circle">

                <div class="score-number" id="scoreNum">
                    0
                </div>

                <div class="score-label">
                    Score
                </div>

            </div>

        </div>

        <!-- BODY -->

        <div class="result-body">

            <!-- STATUS -->

            <div class="status-wrap">

                <span class="status-badge <%= badgeClass %>">

                    <span>
                        <%= badgeEmoji %>
                    </span>

                    <%= badgeText %>

                </span>

            </div>

            <!-- SUMMARY -->

            <div class="summary-box">

                <div class="summary-header">
                    📊 Result Summary
                </div>

                <div class="summary-item">

                    <div class="summary-label">
                        Student Name
                    </div>

                    <div class="summary-value">
                        <%= userName %>
                    </div>

                </div>

                <div class="summary-item">

                    <div class="summary-label">
                        Correct Answers
                    </div>

                    <div class="summary-value"
                         style="color:<%= scoreColor %>;">

                        <%= score %>

                    </div>

                </div>

                <div class="summary-item">

                    <div class="summary-label">
                        Status
                    </div>

                    <div class="summary-value">

                        <span class="status-badge <%= badgeClass %>">

                            <%= badgeEmoji %>
                            <%= badgeText %>

                        </span>

                    </div>

                </div>

            </div>

            <!-- BUTTONS -->

            <div class="action-buttons">

                <a href="${pageContext.request.contextPath}/user/startQuiz.jsp"
                   class="btn-custom btn-primary-custom">

                    🔄 Retry Quiz

                </a>

                <a href="${pageContext.request.contextPath}/user/userDashboard.jsp"
                   class="btn-custom btn-outline-custom">

                    🏠 Dashboard

                </a>

            </div>

        </div>

    </div>

</div>

<script>

const finalScore = <%= score %>;

let current = 0;

const scoreEl = document.getElementById('scoreNum');

const timer = setInterval(() => {

    if(current >= finalScore){

        clearInterval(timer);

        return;
    }

    current++;

    scoreEl.textContent = current;

}, 80);

</script>

</body>
</html>