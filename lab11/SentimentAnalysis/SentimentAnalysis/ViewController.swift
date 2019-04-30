//
//  ViewController.swift
//  SentimentAnalysis
//
//  Created by Entei on 4/25/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sentimentLabel: UILabel!
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.becomeFirstResponder()
        // You might want to initialize some things - but it's up to you.
    }
    
    @IBAction func analyzeButtonPressed(_ sender: Any) {
        guard let textToAnalyze = inputTextView.text else {return}
        let wordList =  textToAnalyze.components(separatedBy: .punctuationCharacters).joined().components(separatedBy: " ").filter{!$0.isEmpty}
        var counts: [String: Double] = [:]
        wordList.forEach { counts[$0, default: 0.0] += 1.0 }
        let model = SentimentPolarity()
        do {
            let output = try model.prediction(input: counts)
            if output.classLabel == "Pos" {
                self.sentimentLabel.text = "Positive"
            } else {
                self.sentimentLabel.text = "Negative"
            }
        } catch {
            return
        }
    }
}

