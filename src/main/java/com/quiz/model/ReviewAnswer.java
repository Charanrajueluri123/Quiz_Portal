package com.quiz.model;


public class ReviewAnswer {

    private Question question;

    private String userAnswer;

    private boolean correct;

    public ReviewAnswer() {
    }

    public ReviewAnswer(Question question, String userAnswer, boolean correct) {

        this.question = question;
        this.userAnswer = userAnswer;
        this.correct = correct;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    public boolean isCorrect() {
        return correct;
    }

    public void setCorrect(boolean correct) {
        this.correct = correct;
    }
}
