//
//  ImagePicker.swift
//  ImagePicker-Starter
//
//  Created by Zehao Huang on 2019/2/21.
//  Copyright © 2019 RJ Pimentel. All rights reserved.
//

import Foundation

class ImagePicker {
    
    var images = [String]()
    
    init() {
        for i in 1...12 {
            images.append("image-\(i)")
        }
    }
    
    func randomize() -> [String] {
        return images.shuffled()
    }
}
