//
//  HangmanGame.swift
//  Hangman
//
//  Created by Zehao Huang on 2019/2/24.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    let hangmanPhrases: HangmanPhrases!
    var phrase: String! = ""
    var potentialGuess: String = ""
    var guessButtonDisabled: Bool! = true
    var incorrectGuesses: [Character]
    var notYetGuessed: [Character]
    
    init() {
        hangmanPhrases = HangmanPhrases()
        incorrectGuesses = [Character]()
        notYetGuessed = [Character]()
    }
    
    func start() {

        phrase = hangmanPhrases.randomPhrase()
        notYetGuessed = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        incorrectGuesses = []
    }
    
    func guessPotential(_ string: String) {
        if string == potentialGuess {
            guessButtonDisabled = true
            potentialGuess = ""
        } else {
            guessButtonDisabled = false
            potentialGuess = string
        }
    }
    
    func getProgressString() -> String {
        var result = phrase!
        for char in notYetGuessed {
            result = result.replacingOccurrences(of: String(char), with: "_")
        }
        return result
    }
    
    func getIncorrectGuesses() -> String {
        var guesses = "Incorrect Guesses: "
        for i in incorrectGuesses {
            guesses += String(i) + " "
        }
        return guesses
    }
    
    func getPotentialGuessString() -> String {
        return "Guess: \(potentialGuess)"
    }
    
    func makeGuess() -> Bool {
        if let index = notYetGuessed.index(of: Character(potentialGuess)) {
            if (!phrase!.contains(potentialGuess)) {
                incorrectGuesses.append(Character(potentialGuess))
            }
            notYetGuessed.remove(at: index)
            return true
        }
        return false
    }
    
    func getStateImage() -> String{
        return "hangman\(7 - incorrectGuesses.count)"
    }
    
    func restart() {
        start()
    }
    
    func win() -> Bool {
        return self.getProgressString() == phrase
    }
    
    func lost() -> Bool {
        return incorrectGuesses.count == 6
    }
}
