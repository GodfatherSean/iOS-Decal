//
//  ImageViewController.swift
//  ImagePicker-Starter
//
//  Created by Zehao Huang on 2019/2/21.
//  Copyright © 2019 RJ Pimentel. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageFileName: String!
    
    @IBOutlet weak var imageViewButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: imageFileName) {
            imageViewButton.setImage(image, for: .normal)
            imageViewButton.imageView?.contentMode = .scaleAspectFill
            
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
