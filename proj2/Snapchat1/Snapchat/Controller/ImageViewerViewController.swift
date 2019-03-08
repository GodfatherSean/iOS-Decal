//
//  ImageViewerViewController.swift
//  Snapchat
//
//  Created by 黄泽皓 on 2019/3/7.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {
    
    var snap: Snap!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        tabBarController?.hidesBottomBarWhenPushed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.contentMode = .scaleAspectFit
        postImageView.image = snap.image
        snap.read = true
    }
    
    @IBAction func goBack() {
        dismiss(animated: true, completion: nil)
    }
}
