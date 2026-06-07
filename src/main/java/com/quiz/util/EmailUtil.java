package com.quiz.util;

import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtil {

	public static void sendEmail(String to, String subject, String otp) throws Exception {
		final String from = "charanutube1@gmail.com";
		final String password = "sevsuyducbohtaby";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		Message message = new MimeMessage(session);

		message.setFrom(new InternetAddress(from));

		message.setRecipients(
				Message.RecipientType.TO,
				InternetAddress.parse(to));

		message.setSubject("🔐 QuizPortal Password Reset OTP");

		String html = """
				<!DOCTYPE html>
				<html>
				<head>
				<meta charset='UTF-8'>
				</head>

				<body style='background:#f4f6f9;
				             margin:0;
				             padding:30px;
				             font-family:Arial,sans-serif;'>

				<div style='max-width:600px;
				            margin:auto;
				            background:#ffffff;
				            border-radius:12px;
				            overflow:hidden;
				            box-shadow:0 4px 15px rgba(0,0,0,0.1);'>

				    <div style='background:#0d6efd;
				                color:white;
				                text-align:center;
				                padding:25px;'>

				        <h1 style='margin:0;'>🎓 QuizPortal</h1>

				        <p style='margin-top:10px;'>
				            Online Quiz Management System
				        </p>

				    </div>

				    <div style='padding:30px;'>

				        <h2>Password Reset Request</h2>

				        <p>Hello,</p>

				        <p>
				            We received a request to reset
				            your QuizPortal account password.
				        </p>

				        <p>
				            Please use the following OTP:
				        </p>

				        <div style='text-align:center;
				                    font-size:32px;
				                    font-weight:bold;
				                    color:#198754;
				                    letter-spacing:5px;
				                    padding:20px;
				                    border:2px dashed #198754;
				                    margin:25px 0;'>

				            """ + otp + """

				        </div>

				        <p>
				            This OTP is valid for
				            <b>5 minutes</b>.
				        </p>

				        <p>
				            Do not share this OTP with anyone.
				        </p>

				        <p>
				            If you didn't request a password reset,
				            simply ignore this email.
				        </p>

				    </div>

				    <div style='background:#f8f9fa;
				                text-align:center;
				                padding:20px;
				                color:#666;'>

				        © 2026 QuizPortal <br>
				        Helping Students Learn Smarter

				    </div>

				</div>

				</body>
				</html>
				""";

		message.setContent(html, "text/html; charset=UTF-8");

		Transport.send(message);
	}
}