//
//  SnapCell.swift
//  Snapchat
//
//  Created by 黄泽皓 on 2019/3/7.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class SnapCell: UITableViewCell {
    
    var snap: Snap!
    @IBOutlet weak var cellUsernameLabel: UILabel!
    @IBOutlet weak var cellTimestampLabel: UILabel!
    @IBOutlet weak var cellIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
