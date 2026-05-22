<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>QuizPortal</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

:root{

    --primary:#2563eb;
    --primary-dark:#1d4ed8;

    --white:#ffffff;

    --dark:#0f172a;

    --gray:#64748b;

    --light:#f8fafc;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Inter,sans-serif;

    min-height:100vh;

    overflow:hidden;

    background:
    radial-gradient(circle at top left,#3b82f620 0%,transparent 30%),
    radial-gradient(circle at bottom right,#2563eb20 0%,transparent 30%),
    linear-gradient(135deg,#eff6ff,#f8fafc);

    color:var(--dark);
}

/* NAVBAR */

.navbar{

    height:80px;

    padding:0 60px;

    display:flex;

    align-items:center;

    justify-content:space-between;
}

.logo{

    display:flex;

    align-items:center;

    gap:14px;

    font-size:1.6rem;

    font-weight:800;

    color:var(--dark);
}

.logo-icon{

    width:48px;
    height:48px;

    border-radius:16px;

    background:linear-gradient(135deg,#2563eb,#4f46e5);

    display:flex;

    align-items:center;

    justify-content:center;

    color:white;

    font-size:1.3rem;

    box-shadow:0 10px 25px rgba(37,99,235,.25);
}

.nav-links{

    display:flex;

    align-items:center;

    gap:14px;
}

.nav-btn{

    text-decoration:none;

    padding:12px 22px;

    border-radius:14px;

    font-weight:700;

    font-size:.95rem;

    transition:.25s;
}

.login-btn{

    color:var(--dark);

    background:white;

    border:1px solid #dbeafe;
}

.login-btn:hover{

    background:#eff6ff;
}

.register-btn{

    background:linear-gradient(135deg,#2563eb,#4f46e5);

    color:white;

    box-shadow:0 10px 25px rgba(37,99,235,.22);
}

.register-btn:hover{

    transform:translateY(-2px);
}

/* HERO */

.hero-section{

    min-height:calc(100vh - 80px);

    display:flex;

    align-items:center;

    justify-content:center;

    padding:20px 60px 60px;
}

.hero-content{

    width:100%;

    max-width:1200px;

    display:grid;

    grid-template-columns:1.1fr .9fr;

    align-items:center;

    gap:60px;
}

/* LEFT */

.left-side{

    position:relative;
}

.tag{

    display:inline-flex;

    align-items:center;

    gap:8px;

    background:#dbeafe;

    color:#2563eb;

    padding:10px 18px;

    border-radius:999px;

    font-size:.82rem;

    font-weight:700;

    margin-bottom:28px;
}

.main-heading{

    font-size:4.2rem;

    line-height:1.1;

    font-weight:900;

    color:var(--dark);

    margin-bottom:24px;
}

.gradient-text{

    background:linear-gradient(135deg,#2563eb,#7c3aed);

    -webkit-background-clip:text;

    -webkit-text-fill-color:transparent;
}

.description{

    font-size:1.08rem;

    line-height:1.9;

    color:var(--gray);

    max-width:620px;

    margin-bottom:40px;
}

/* BUTTONS */

.hero-buttons{

    display:flex;

    align-items:center;

    gap:18px;

    margin-bottom:50px;
}

.hero-btn{

    text-decoration:none;

    padding:16px 28px;

    border-radius:18px;

    font-weight:700;

    font-size:1rem;

    display:flex;

    align-items:center;

    gap:10px;

    transition:.25s;
}

.primary-btn{

    background:linear-gradient(135deg,#2563eb,#4f46e5);

    color:white;

    box-shadow:0 12px 30px rgba(37,99,235,.22);
}

.primary-btn:hover{

    transform:translateY(-3px);
}

.secondary-btn{

    background:white;

    color:var(--dark);

    border:1px solid #dbeafe;
}

.secondary-btn:hover{

    background:#eff6ff;
}

/* STATS */

.stats{

    display:flex;

    gap:50px;
}

.stat-box h2{

    font-size:2.2rem;

    font-weight:800;

    color:var(--dark);

    margin-bottom:4px;
}

.stat-box p{

    color:var(--gray);

    font-size:.92rem;
}

/* RIGHT */

.right-side{

    position:relative;

    display:flex;

    justify-content:center;
}

.floating-card{

    width:100%;

    max-width:430px;

    background:white;

    border-radius:32px;

    padding:34px;

    box-shadow:0 20px 60px rgba(15,23,42,.08);

    position:relative;

    overflow:hidden;
}

.floating-card::before{

    content:"";

    position:absolute;

    top:0;
    left:0;

    width:100%;
    height:6px;

    background:linear-gradient(135deg,#2563eb,#7c3aed);
}

.quiz-icon{

    width:82px;
    height:82px;

    border-radius:24px;

    background:linear-gradient(135deg,#2563eb,#4f46e5);

    display:flex;

    align-items:center;

    justify-content:center;

    color:white;

    font-size:2rem;

    margin-bottom:26px;
}

.floating-card h3{

    font-size:2rem;

    font-weight:800;

    margin-bottom:16px;
}

.floating-card p{

    color:var(--gray);

    line-height:1.8;

    margin-bottom:30px;
}

.feature{

    display:flex;

    align-items:flex-start;

    gap:14px;

    margin-bottom:22px;
}

.feature-icon{

    width:42px;
    height:42px;

    border-radius:14px;

    background:#eff6ff;

    color:#2563eb;

    display:flex;

    align-items:center;

    justify-content:center;

    font-size:1rem;

    flex-shrink:0;
}

.feature-text h4{

    font-size:1rem;

    font-weight:700;

    margin-bottom:5px;
}

.feature-text p{

    margin:0;

    font-size:.9rem;

    line-height:1.6;
}

/* MOBILE */

@media(max-width:992px){

    body{

        overflow:auto;
    }

    .navbar{

        padding:20px;
    }

    .hero-section{

        padding:20px;
    }

    .hero-content{

        grid-template-columns:1fr;
    }

    .main-heading{

        font-size:2.8rem;
    }

    .hero-buttons{

        flex-direction:column;

        align-items:stretch;
    }

    .stats{

        gap:30px;

        flex-wrap:wrap;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">

        <div class="logo-icon">
            <i class="bi bi-mortarboard-fill"></i>
        </div>

        QuizPortal

    </div>

    <div class="nav-links">

        <a href="login.jsp"
           class="nav-btn login-btn">
            Login
        </a>

        <a href="register.jsp"
           class="nav-btn register-btn">
            Create Account
        </a>

    </div>

</div>

<!-- HERO -->

<section class="hero-section">

    <div class="hero-content">

        <!-- LEFT -->

        <div class="left-side">

            <div class="tag">

                <i class="bi bi-lightning-charge-fill"></i>

                JAVA QUIZ PLATFORM

            </div>

            <h1 class="main-heading">

                Improve Your

                <span class="gradient-text">
                    Java Skills
                </span>

                Through Smart Quizzes

            </h1>

            <p class="description">

                Practice core Java concepts, test your programming knowledge,
                and track your quiz performance with a modern interactive platform.

            </p>

            <div class="hero-buttons">

                <a href="register.jsp"
                   class="hero-btn primary-btn">

                    <i class="bi bi-person-plus-fill"></i>

                    Start Learning

                </a>

                <a href="login.jsp"
                   class="hero-btn secondary-btn">

                    <i class="bi bi-box-arrow-in-right"></i>

                    Login

                </a>

            </div>

            <div class="stats">

                <div class="stat-box">

                    <h2>100+</h2>

                    <p>Quiz Questions</p>

                </div>

                <div class="stat-box">

                    <h2>Instant</h2>

                    <p>Result Tracking</p>

                </div>

                <div class="stat-box">

                    <h2>Easy</h2>

                    <p>User Experience</p>

                </div>

            </div>

        </div>

        <!-- RIGHT -->

        <div class="right-side">

            <div class="floating-card">

                <div class="quiz-icon">

                    <i class="bi bi-code-slash"></i>

                </div>

                <h3>

                    Java Knowledge Test

                </h3>

                <p>

                    A clean and interactive platform designed for students
                    to practice Java programming concepts effectively.

                </p>

                <div class="feature">

                    <div class="feature-icon">

                        <i class="bi bi-check-circle-fill"></i>

                    </div>

                    <div class="feature-text">

                        <h4>
                            Multiple Choice Questions
                        </h4>

                        <p>
                            Practice with structured quiz questions.
                        </p>

                    </div>

                </div>

                <div class="feature">

                    <div class="feature-icon">

                        <i class="bi bi-graph-up-arrow"></i>

                    </div>

                    <div class="feature-text">

                        <h4>
                            Performance Tracking
                        </h4>

                        <p>
                            View your score immediately after submission.
                        </p>

                    </div>

                </div>

                <div class="feature">

                    <div class="feature-icon">

                        <i class="bi bi-lightning-fill"></i>

                    </div>

                    <div class="feature-text">

                        <h4>
                            Fast & Responsive
                        </h4>

                        <p>
                            Smooth experience across desktop and mobile.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>

</body>
</html>