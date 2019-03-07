//
//  FeedPickerViewController.swift
//  Snapchat
//
//  Created by 黄泽皓 on 2019/3/6.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedPickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var selectedImageLabel: UILabel!
    @IBOutlet weak var selectedFeedLabel: UILabel!
    @IBOutlet weak var feedPickerTableView: UITableView!
    
    var selectedImage: String!
    var selectedFeed: String!
    let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedPickerTableView.dataSource = self
        feedPickerTableView.delegate = self
        if let label = selectedImage as? String {
            selectedImageLabel.text = "Posting image: '\(label)'"
        }
        self.title = "Feed"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell {
            cell.cellFeedLabel.text = data.feeds[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dimension = self.feedPickerTableView.frame.size.width / 2.1;
        return CGFloat(dimension / 2)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFeedLabel.text = "To feed: '\(data.feeds[indexPath.row])'"
        selectedFeedLabel.text = "To feed: '\(data.feeds[indexPath.item])'"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
