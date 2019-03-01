//
//  Hangman.swift
//  Hangman
//
//  Created by Zehao Huang on 2019/2/23.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class HangmanPhrases {
    
    var phrases: NSArray!
    
    init () {
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)
    }
    
    func randomPhrase() -> String {
        return phrases.shuffled()[0] as! String
    }
    
    // TODO: Implement other functionalities
}
