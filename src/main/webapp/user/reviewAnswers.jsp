<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.quiz.model.ReviewAnswer" %>
<%@ page import="com.quiz.model.Question" %>

<%
List<ReviewAnswer> reviewList =
(List<ReviewAnswer>) session.getAttribute("reviewList");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Review Answers</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

body{

    background:#f1f5f9;
    font-family:Arial;
}

.wrapper{

    max-width:900px;
    margin:auto;
    padding:30px 15px;
}

.review-card{

    background:white;

    border-radius:18px;

    padding:20px;

    margin-bottom:20px;

    box-shadow:0 4px 15px rgba(0,0,0,.06);
}

.question{

    font-size:1.1rem;

    font-weight:700;

    margin-bottom:14px;
}

.option{

    padding:10px 14px;

    border-radius:10px;

    margin-bottom:10px;

    border:1px solid #e2e8f0;
}

.correct{

    background:#dcfce7;

    border-color:#22c55e;
}

.wrong{

    background:#fee2e2;

    border-color:#ef4444;
}

.answer-label{

    font-weight:700;
}

.top{

    text-align:center;

    margin-bottom:30px;
}

</style>

</head>

<body>

<div class="wrapper">

    <div class="top">

        <h1>
            📘 Answer Review
        </h1>

        <p>
            Review all questions and correct answers
        </p>

    </div>

<%
if(reviewList != null){

    int count = 1;

    for(ReviewAnswer r : reviewList){

        Question q = r.getQuestion();
%>

<div class="review-card">

    <div class="question">

        Q<%= count++ %>.
        <%= q.getQuestion() %>

    </div>

    <div class="option
    <%= r.isCorrect() ? "correct" : "wrong" %>">

        <span class="answer-label">

            Your Answer:

        </span>

        <%= r.getUserAnswer() %>

    </div>

    <div class="option correct">

        <span class="answer-label">

            Correct Answer:

        </span>

        <%= q.getCorrectAnswer() %>

    </div>

</div>

<%
    }
}
%>

<div class="text-center mt-4">

    <a href="${pageContext.request.contextPath}/user/userDashboard.jsp"
       class="btn btn-primary">

        Back to Dashboard

    </a>

</div>

</div>

</body>

</html>