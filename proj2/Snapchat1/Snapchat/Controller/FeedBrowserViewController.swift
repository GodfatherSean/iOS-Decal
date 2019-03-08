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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
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
            cell.cellIconImageView.image = UIImage(named: "unread")?.withAlignmentRectInsets(
                UIEdgeInsets(top: -4, left: -4, bottom: -4, right: -4))
            cell.cellUsernameLabel.text = cell.snap.user
            cell.cellTimestampLabel.text = formatTimestamp(cell.snap)
            return cell
        }
        return UITableViewCell()
    }
    
    private func formatTimestamp(_ snap: Snap) -> String! {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        if let formatted = formatter.string(from: snap.time, to: Date()) {
            return "posted \(formatted) ago."
        }
        return "error string"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
