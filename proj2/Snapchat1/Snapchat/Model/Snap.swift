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
    var read: Bool! = false
    
    init (snapImage: UIImage, userName: String, feedName: String, timestamp: Date) {
        image = snapImage
        user = userName
        feed = feedName
        time = timestamp
    }
    
    func formatTimestamp() -> String! {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        if let formatted = formatter.string(from: time, to: Date()) {
            return "posted \(formatted) ago."
        }
        return "error string"
    }
    
    func getIconImage() -> UIImage! {
        if (read) {
            return UIImage(named: "read")?.withAlignmentRectInsets(
                UIEdgeInsets(top: -4, left: -4, bottom: -4, right: -4))
        } else {
            return UIImage(named: "unread")?.withAlignmentRectInsets(
                UIEdgeInsets(top: -4, left: -4, bottom: -4, right: -4))
        }
    }
}
