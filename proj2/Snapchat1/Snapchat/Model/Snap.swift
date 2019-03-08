//
//  Snap.swift
//  Snapchat
//
//  Created by 黄泽皓 on 2019/3/7.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap {
    
    var image: UIImage!
    var user: String!
    var feed: String!
    var time: Date!
    
    init (snapImage: UIImage, userName: String, feedName: String, timestamp: Date) {
        image = snapImage
        user = userName
        feed = feedName
        time = timestamp
    }
}
