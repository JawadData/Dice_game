package com.bo;

public class Dice {
    private int diceNumber;
    private int diceResult;

    public Dice(int diceNumber, int diceResult) {
        this.diceNumber = diceNumber;
        this.diceResult = diceResult;
    }


    public int getDiceNumber() {
        return diceNumber;
    }

    public void setDiceNumber(int diceNumber) {
        this.diceNumber = diceNumber;
    }

    public int getDiceResult() {
        return diceResult;
    }

    public void setDiceResult(int diceResult) {
        this.diceResult = diceResult;
    }
}



