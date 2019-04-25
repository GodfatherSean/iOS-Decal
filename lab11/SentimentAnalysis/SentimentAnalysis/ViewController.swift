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
        // Your code here
    }
}

