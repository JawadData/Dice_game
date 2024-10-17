package com.bo;

import java.util.ArrayList;
import java.util.List;

public class GameState {

	private User user;

	private boolean gameOver = false;

	private static int Compteur=1;

	private List<Message> messages = new ArrayList<Message>();

	public void reinit() {
		gameOver = false;
		messages = new ArrayList<Message>();
		user.setScore(0);
		this.setCompteur(0);

	}
	public void IncrementCompteur() {
		    Compteur+=1;
	}


	public void addMessage(Message ms) {
		messages.add(ms);
	}

	public GameState(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isGameOver() {
		return gameOver;
	}

	public void setGameOver(boolean gameOver) {
		this.gameOver = gameOver;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public int getCompteur() {
		return Compteur;
	}

	public static void setCompteur(int compteur) {
		Compteur = compteur;
	}
}
