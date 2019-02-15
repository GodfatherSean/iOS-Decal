//
//  DrummerViewController.swift
//  Drummer
//
//  Created by David [Entei] Xiong on 2/14/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class DrummerViewController: UIViewController {

    // Our DrumKit models as an instance of the object
    
    // Drum Kit 0 (Acoustic Drum Kit)
    let drumKit0 = DrumKit(drumKitID: 0)
    // Drum Kit 1 (Electronic Drum Kit)
    let drumKit1 = DrumKit(drumKitID: 1)
    
    // The currently selected drum kit (default = 0)
    var currentDrumKit: DrumKit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // sets the default drum kit to drumkit0
        currentDrumKit = drumKit0
    }
    
    
    // YOUR CODE HERE


}

