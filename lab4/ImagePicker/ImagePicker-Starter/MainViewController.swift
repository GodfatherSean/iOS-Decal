//
//  MainViewController.swift
//  ImagePicker-Starter
//
//  Created by RJ Pimentel on 2/21/19.
//  Copyright © 2019 RJ Pimentel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var imagePicker = ImagePicker()
    var images = [String]()
    
    @IBOutlet weak var randomizationButton: UIButton!
    @IBOutlet weak var stack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeImages(randomizationButton)
    }

    @IBAction func randomizeImages(_ sender: UIButton) {
        images = imagePicker.randomize()
        if let stack = stack {
            for substack in stack.arrangedSubviews {
                if let substack = substack as? UIStackView {
                    for button in substack.arrangedSubviews {
                        if let button = button as? UIButton {
                            if let image = UIImage(named: images[button.tag]) {
                                button.setImage(image, for: .normal)
                                button.imageView?.contentMode = .scaleAspectFill
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ImageViewController {
            if let button = sender as? UIButton {
               dest.imageFileName = images[button.tag]
            }
        }
    }
}

