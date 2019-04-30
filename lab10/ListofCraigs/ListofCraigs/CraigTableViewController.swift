//
//  CraigTableViewController.swift
//  ListofCraigs
//
//  Created by David [Entei] Xiong on 4/11/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import RealmSwift

class Craig : Object { // Provided for your convenience. You may need to change some things here later.
    
    @objc dynamic var name = ""
    @objc dynamic var occupation = ""
    
}

class CraigTableViewController: UITableViewController {
    
    let realm = try! Realm()
    let craigs = try! Realm().objects(Craig.self)
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.title = "List of Craigs"
        if self.realm.isEmpty {
            for item in [["Anderson", "Hockey Player"],
                         ["David", "Pop Star"],
                         ["Federighi", "Apple Executive"],
                         ["Ferguson", "Talk Show Host"]] {
                let craig = Craig()
                craig.name = item[0]
                craig.occupation = item[1]
                try! realm.write {
                    realm.add(craig)
                }
            }
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.craigs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "craigCell", for: indexPath)
        cell.textLabel?.text = "Craig \(craigs[indexPath.row].name): \(craigs[indexPath.row].occupation)"
        return cell
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "New Craig", message: "Add a new name and occupation", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            [unowned self] action in
            guard let nameField = alert.textFields?.first,
                let nameToSave = nameField.text else { return }
            guard let occupationField = alert.textFields?[1],
                let occupationToSave = occupationField.text else { return }
            try! self.realm.write {
                let craig = Craig()
                craig.name = nameToSave
                craig.occupation = occupationToSave
                self.realm.add(craig)
            }
            self.tableView.reloadData()
        }
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            try! self.realm.write {
                self.realm.delete(self.craigs[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}
