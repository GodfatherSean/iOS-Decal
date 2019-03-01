//
//  StartGameViewController.swift
//  Hangman
//
//  Created by Zehao Huang on 2019/2/24.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? HangmanViewController {
            // TODO: Implement
        }
    }

}
