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
    @IBOutlet weak var makePostButton: UIButton!
    
    var selectedImage: String!
    var selectedFeed: String!
    var selectedFeedIndex: Int!
    let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedPickerTableView.dataSource = self
        feedPickerTableView.delegate = self
        makePostButton.isEnabled = false
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
        selectedFeed = data.feeds[indexPath.row]
        selectedFeedLabel.text = "To feed: '\(data.feeds[indexPath.row])'"
        selectedFeedIndex = indexPath.row
        makePostButton.isEnabled = true
    }
    
    @IBAction func makePost(_ sender: UIButton) {
        // save the new post to the global array.
        let snapImage = UIImage(named: selectedImage)!
        let snap = Snap(snapImage: snapImage, userName: "Zehao Huang", feedName: selectedFeed, timestamp: Date())
        feedData[selectedFeedIndex]?.append(snap)
        // Show posted alert and go back
        let postSuccessAlert = UIAlertController(title: "Snap Posted!", message: "Your snap is saved.", preferredStyle: .alert)
        postSuccessAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) -> Void in
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(postSuccessAlert, animated: true, completion: nil)
    }

}
