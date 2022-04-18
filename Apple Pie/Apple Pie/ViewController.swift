//
//  ViewController.swift
//  Apple Pie
//
//  Created by student on 2/14/22.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["buccaneer", "swift", "glorius", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0{
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!

    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var tree: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    func updateGameState()
    {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
      
    }
    func newRound()
    {
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    func updateUI(){
        var  letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scorelabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        tree.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }



}

