//
//  FeedBrowserViewController.swift
//  Snapchat
//
//  Created by 黄泽皓 on 2019/3/7.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class FeedBrowserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let data = Data()
    var selectedSnap: Snap!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.feeds.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let snaps = feedData[section] {
            return snaps.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return CGFloat(25)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data.feeds[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 25))
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: 25))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        label.text = data.feeds[section]
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "snapCell") as? SnapCell {
            if let snaps = feedData[indexPath.section] {
                cell.snap = snaps[indexPath.row]
            }
            cell.cellIconImageView.contentMode = .scaleAspectFill
            cell.cellIconImageView.image = cell.snap.getIconImage()
            cell.cellUsernameLabel.text = cell.snap.user
            cell.cellTimestampLabel.text = cell.snap.formatTimestamp()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let snap = feedData[indexPath.section]?[indexPath.row] {
            selectedSnap = snap
        }
        if !selectedSnap.read {
            performSegue(withIdentifier: "viewImage", sender: selectedSnap)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "viewImage" {
                if let dest = segue.destination as? ImageViewerViewController, let snap = sender as? Snap {
                    dest.snap = snap
                }
            }
        }
    }
}
