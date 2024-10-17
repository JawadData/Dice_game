package com.bo;

public class User {
    private String nom;
    private String login;

    private String password;

    private double score;

    private double bestScore;

    public User() {
    }

    public User(String nom, String login, String password, double score, double bestScore, int compteurLancer) {
        this.nom = nom;
        this.login = login;
        this.password = password;
        this.score = score;
        this.bestScore = bestScore;
    }

    @Override
    public String toString() {
        return "Utilisateur [ nom=" + nom + ", login="
                + login + ", password=" + password + ", score=" + score + ", bestScore=" + bestScore +"]";
    }

    public User(String nom, String login, String password, double score, double bestScore) {
        this.nom = nom;
        this.login = login;
        this.password = password;
        this.score = score;
        this.bestScore = bestScore;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {

        this.score = score;
    }

    public double getBestScore() {
        return bestScore;
    }

    public void setBestScore(double bestScore) {
        this.bestScore = bestScore;
    }

}
