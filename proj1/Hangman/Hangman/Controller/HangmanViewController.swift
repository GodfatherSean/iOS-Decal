//
//  HangmanViewController
//  Hangman
//
//  Created by David [Entei] Xiong on 2/19/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var game: HangmanGame! = HangmanGame()
    
    @IBOutlet weak var exitGameButton: UIButton!
    @IBOutlet weak var startOverButton: UIBarButtonItem!
    @IBOutlet weak var hangmanStateImage: UIImageView!
    @IBOutlet weak var guessedPhraseLabel: UILabel!
    @IBOutlet weak var incorrectGuessesLabel: UILabel!
    @IBOutlet weak var potentialGuessLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessedPhraseLabel.lineBreakMode = .byWordWrapping
        guessedPhraseLabel.numberOfLines = 3
        game.start()
        render()
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        game.restart()
        render()
    }
    
    @IBAction func exitGame(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func makePotentialGuess(_ sender: UIButton) {
        if let char = sender.titleLabel?.text {
            game.guessPotential(char)
        }
        render()
    }
    
    @IBAction func guess(_ sender: UIButton) {
        game.makeGuess()
        if game.lost() {
            // game lost
            let handler = { (action: UIAlertAction!) -> Void in
                self.game.restart()
                self.render()
            }
            let action = UIAlertAction(title: "New Game", style: .default, handler: handler)
            let lost = UIAlertController(title: "Hanged Man!", message: "You lost! Try again!", preferredStyle: .alert)
            lost.addAction(action)
            present(lost, animated: true, completion: nil)
        }
        if game.win() {
            let win = UIAlertController(title: "Man Not Hanged!", message: "You won! Play another game?", preferredStyle: .alert)
            let handler = { (action: UIAlertAction!) -> Void in
                self.game.restart()
                self.render()
            }
            let action = UIAlertAction(title: "New Game", style: .default, handler: handler)
            win.addAction(action)
            present(win, animated: true, completion: nil)
        }
        
        render()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func render() {
        guessedPhraseLabel.text = game.getProgressString()
        potentialGuessLabel.text = game.getPotentialGuessString()
        incorrectGuessesLabel.text = game.getIncorrectGuesses()
        guessButton.isEnabled = !game.guessButtonDisabled
        hangmanStateImage.image = UIImage(named: game.getStateImage())
    }
    
}

