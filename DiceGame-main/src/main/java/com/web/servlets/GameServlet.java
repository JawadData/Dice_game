package com.web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.bo.Dice;
import com.bo.GameState;
import com.bo.Message;
import com.bo.User;
import com.web.helpers.GameContextManagement;

@WebServlet("/back/GameServlet")
public class GameServlet extends HttpServlet {
    
    protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());
        GameState gameState = (GameState) session.getAttribute("gameState");

        int diceNumber = Integer.parseInt(request.getParameter("diceNumber"));
        Random rd = new Random();
        int diceResult = rd.nextInt(6) + 1;
        Dice dice = new Dice(diceNumber, diceResult);

        List<Message> msg = new ArrayList<>();
        ArrayList<Dice> dices = (ArrayList<Dice>) session.getAttribute("dices");

        if (dices == null) {
            dices = new ArrayList<>();
            session.setAttribute("dices", dices);
        }

        if (dices.isEmpty()) {
            // Add first rolled dice
            dices.add(dice);
            gameState.IncrementCompteur();
            msg.add(new Message("Dice " + diceNumber + ": " + diceResult, Message.INFO));
            request.setAttribute("messages", msg);
        } else {
            // Check if the same die is rolled twice
            boolean exists = false;
            for (Dice d : dices) {
                if (d.getDiceNumber() == diceNumber) {
                    exists = true;
                    break;
                }
            }
            if (exists) {
                user.setScore(-1);
                if (user.getScore() >= user.getBestScore()) {
                    user.setBestScore(user.getScore());
                   // gameContext.updateScore(user);
                }
                getServletContext().getRequestDispatcher("/WEB-INF/vues/back/resultat.jsp").forward(request, response);
                return;
            } else {
                dices.add(dice);
                msg.add(new Message("Dice " + diceNumber + ": " + diceResult, Message.INFO));
                request.setAttribute("messages", msg);
                gameState.IncrementCompteur();
            }
            
            // Check if the condition is met: result of dice 1 < result of dice 2 < result of dice 3
            boolean conditionMet = true;
            for (int i = 0; i < dices.size() - 1; i++) {
                if (dices.get(i).getDiceResult() >= dices.get(i + 1).getDiceResult()) {
                    conditionMet = false;
                    break;
                }
            }
            if (!conditionMet) {
                user.setScore(0);
                gameState.reinit();
                getServletContext().getRequestDispatcher("/WEB-INF/vues/back/resultat.jsp").forward(request, response);
                return;
            }
        }
        
        if (dices.size() == 3) {
            user.setScore(dices.get(0).getDiceResult() + dices.get(1).getDiceResult() + dices.get(2).getDiceResult());
            if (user.getScore() > user.getBestScore()) {
                user.setBestScore(user.getScore());
                gameContext.updateScore(user);
            }
            gameState.reinit();
            getServletContext().getRequestDispatcher("/WEB-INF/vues/back/resultat.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        play(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        play(request, response);
    }
}