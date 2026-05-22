<%@ page import="java.util.List"%>
<%@ page import="com.quiz.model.Question"%>
<%@ page import="com.quiz.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User loggedUser = (User) session.getAttribute("user");
String userName = (loggedUser != null) ? loggedUser.getName() : "Student";
String userInitial = userName.length() > 0 ? String.valueOf(userName.charAt(0)).toUpperCase() : "S";

List<Question> questions = (List<Question>) request.getAttribute("questions");
int totalQ = (questions != null) ? questions.size() : 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Quiz - QuizPortal</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
:root {
	--primary: #2563eb;
	--primary-dark: #1d4ed8;
	--primary-light: #eff6ff;
	--dark: #0f172a;
	--gray-100: #f1f5f9;
	--gray-200: #e2e8f0;
	--gray-300: #cbd5e1;
	--gray-500: #64748b;
	--gray-700: #334155;
	--white: #ffffff;
	--radius: 18px;
	--shadow: 0 10px 30px rgba(0, 0, 0, .08);
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Inter, sans-serif;
	background: var(--gray-100);
	color: var(--dark);
}

/* NAVBAR */
.app-navbar {
	height: 80px;
	background: white;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 32px;
	border-bottom: 1px solid var(--gray-200);
	position: sticky;
	top: 0;
	z-index: 100;
}

.brand {
	text-decoration: none;
	color: var(--dark);
	font-size: 1.6rem;
	font-weight: 700;
	display: flex;
	align-items: center;
	gap: 12px;
}

.brand-icon {
	width: 44px;
	height: 44px;
	border-radius: 14px;
	background: linear-gradient(135deg, #2563eb, #4f46e5);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

.nav-user {
	display: flex;
	align-items: center;
	gap: 18px;
}

.progress-mini {
	font-weight: 600;
	color: var(--gray-500);
}

.user-pill {
	background: #f8fafc;
	border-radius: 999px;
	padding: 8px 16px;
	display: flex;
	align-items: center;
	gap: 12px;
}

.avatar {
	width: 38px;
	height: 38px;
	border-radius: 50%;
	background: linear-gradient(135deg, #2563eb, #7c3aed);
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 700;
}

/* MAIN */
.main-wrapper {
	max-width: 900px;
	margin: 40px auto;
	padding: 0 20px;
}

/* PROGRESS */
.quiz-progress-card {
	background: white;
	border-radius: var(--radius);
	padding: 24px;
	margin-bottom: 24px;
	box-shadow: var(--shadow);
}

.progress-top {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.progress-track {
	width: 100%;
	height: 12px;
	background: #e5e7eb;
	border-radius: 999px;
	overflow: hidden;
}

.progress-fill {
	height: 100%;
	width: 0%;
	background: linear-gradient(135deg, #2563eb, #7c3aed);
	transition: .3s;
}

/* QUESTION CARD */
.question-card {
	display: none;
	background: white;
	border-radius: 24px;
	padding: 35px;
	box-shadow: var(--shadow);
	animation: fade .3s ease;
}

.question-card.active {
	display: block;
}

@
keyframes fade {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.question-badge {
	display: inline-block;
	padding: 6px 14px;
	border-radius: 999px;
	background: var(--primary-light);
	color: var(--primary);
	font-weight: 700;
	font-size: .85rem;
	margin-bottom: 20px;
}

.question-text {
	font-size: 1.35rem;
	font-weight: 700;
	line-height: 1.5;
	margin-bottom: 28px;
}

/* OPTIONS */
.options {
	display: flex;
	flex-direction: column;
	gap: 16px;
}

.option-label {
	border: 2px solid var(--gray-200);
	border-radius: 18px;
	padding: 18px 20px;
	cursor: pointer;
	transition: .25s;
	display: flex;
	align-items: center;
	gap: 16px;
	background: white;
}

.option-label:hover {
	border-color: #93c5fd;
	background: #f8fbff;
}

.option-label.selected {
	border-color: var(--primary);
	background: var(--primary-light);
}

.option-label input {
	transform: scale(1.2);
}

.option-text {
	font-size: 1rem;
	color: var(--gray-700);
	font-weight: 500;
}

/* NAV BUTTONS */
.quiz-navigation {
	margin-top: 28px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.btn-custom {
	border: none;
	border-radius: 14px;
	padding: 12px 24px;
	font-weight: 600;
	transition: .25s;
}

.btn-prev {
	background: #e2e8f0;
	color: #334155;
}

.btn-prev:hover {
	background: #cbd5e1;
}

.btn-next, .btn-submit {
	background: linear-gradient(135deg, #2563eb, #4f46e5);
	color: white;
}

.btn-next:hover, .btn-submit:hover {
	opacity: .95;
}

@media ( max-width :768px) {
	.question-card {
		padding: 24px;
	}
	.question-text {
		font-size: 1.1rem;
	}
	.app-navbar {
		padding: 0 16px;
	}
	.progress-mini {
		display: none;
	}
}
</style>
</head>

<body>

	<!-- NAVBAR -->

	<nav class="app-navbar">

		<a href="userDashboard.jsp" class="brand">
			<div class="brand-icon">
				<i class="bi bi-mortarboard-fill"></i>
			</div> QuizPortal
		</a>

		<div class="nav-user">

			<div class="progress-mini">
				<i class="bi bi-clock"></i> Time Left: <span id="timer">05:00</span>
			</div>
			<div class="progress-mini">
				<i class="bi bi-check-circle"></i> <span id="answeredCount">0</span>
				/
				<%=totalQ%>
				answered
			</div>

			<div class="user-pill">
				<div class="avatar"><%=userInitial%></div>
				<span><%=userName%></span>
			</div>

		</div>

	</nav>

	<!-- MAIN -->

	<div class="main-wrapper">

		<!-- PROGRESS -->

		<div class="quiz-progress-card">

			<div class="progress-top">
				<span style="font-weight: 700;">Quiz Progress</span> <span
					id="progressLabel">0%</span>
			</div>

			<div class="progress-track">
				<div class="progress-fill" id="progressBar"></div>
			</div>

		</div>

		<!-- FORM -->

		<form action="${pageContext.request.contextPath}/submitQuiz"
			method="post" id="quizForm">

			<%
			if (questions != null && !questions.isEmpty()) {

				int qIndex = 0;

				for (Question q : questions) {

					qIndex++;
			%>

			<!-- QUESTION -->

			<div class="question-card <%=(qIndex == 1) ? "active" : ""%>">

				<div class="question-badge">
					Question
					<%=qIndex%>
					of
					<%=totalQ%>
				</div>

				<div class="question-text">
					<%=q.getQuestion()%>
				</div>

				<div class="options">

					<label class="option-label"> <input type="radio"
						name="question_<%=q.getId()%>" value="<%=q.getOption1()%>"
						onchange="updateProgress()"> <span class="option-text">
							<%=q.getOption1()%>
					</span>

					</label> <label class="option-label"> <input type="radio"
						name="question_<%=q.getId()%>" value="<%=q.getOption2()%>"
						onchange="updateProgress()"> <span class="option-text">
							<%=q.getOption2()%>
					</span>

					</label> <label class="option-label"> <input type="radio"
						name="question_<%=q.getId()%>" value="<%=q.getOption3()%>"
						onchange="updateProgress()"> <span class="option-text">
							<%=q.getOption3()%>
					</span>

					</label> <label class="option-label"> <input type="radio"
						name="question_<%=q.getId()%>" value="<%=q.getOption4()%>"
						onchange="updateProgress()"> <span class="option-text">
							<%=q.getOption4()%>
					</span>

					</label>

				</div>

				<!-- BUTTONS -->

				<div class="quiz-navigation">

					<button type="button" class="btn-custom btn-prev"
						onclick="prevQuestion()">

						<i class="bi bi-arrow-left"></i> Previous

					</button>

					<%
					if (qIndex < totalQ) {
					%>

					<button type="button" class="btn-custom btn-next"
						onclick="nextQuestion()">

						Next <i class="bi bi-arrow-right"></i>

					</button>

					<%
					} else {
					%>

					<button type="submit" class="btn-custom btn-submit">

						<i class="bi bi-send"></i> Submit Quiz

					</button>

					<%
					}
					%>

				</div>

			</div>

			<%
			}
			}
			%>

		</form>

	</div>

	<script>

const totalQuestions = <%=totalQ%>;

const cards = document.querySelectorAll('.question-card');

let currentQuestion = 0;

/* NEXT */

function nextQuestion(){

    if(currentQuestion < cards.length - 1){

        cards[currentQuestion].classList.remove('active');

        currentQuestion++;

        cards[currentQuestion].classList.add('active');

        window.scrollTo({
            top:0,
            behavior:'smooth'
        });
    }
}

/* PREVIOUS */

function prevQuestion(){

    if(currentQuestion > 0){

        cards[currentQuestion].classList.remove('active');

        currentQuestion--;

        cards[currentQuestion].classList.add('active');

        window.scrollTo({
            top:0,
            behavior:'smooth'
        });
    }
}

/* PROGRESS */

function updateProgress(){

    const form = document.getElementById('quizForm');

    const answered = new Set(
        Array.from(
            form.querySelectorAll('input[type="radio"]:checked')
        ).map(r => r.name)
    ).size;

    document.getElementById('answeredCount').textContent = answered;

    const pct = totalQuestions > 0
        ? Math.round((answered / totalQuestions) * 100)
        : 0;

    document.getElementById('progressBar').style.width = pct + '%';

    document.getElementById('progressLabel').textContent = pct + '%';
}

/* OPTION HIGHLIGHT */

document.addEventListener('change', function(e){

    if(e.target.type === 'radio'){

        const group = document.querySelectorAll(
            `input[name="${e.target.name}"]`
        );

        group.forEach(r => {
            r.closest('.option-label').classList.remove('selected');
        });

        e.target.closest('.option-label').classList.add('selected');
    }
});


/* =========================
   QUIZ TIMER
========================= */

// 5 minutes timer
let totalTime = 5 * 60;

const timerEl = document.getElementById("timer");

const countdown = setInterval(() => {

    let minutes = Math.floor(totalTime / 60);
    let seconds = totalTime % 60;

    // format 05:09
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    timerEl.textContent = minutes + ":" + seconds;

    totalTime--;

    // timeout
    if(totalTime < 0){

        clearInterval(countdown);

        alert("Time is up! Quiz will be submitted automatically.");

        document.getElementById("quizForm").submit();
    }

}, 1000);



</script>

</body>
</html>