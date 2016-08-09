//
//  SettingsView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class SettingsView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let section = ["    ", "    ", "    ", "    ", "    "]
    let items = [["User"], ["Starred Messages", "WhatsApp Web/Desktop"], ["Account", "Chats", "Notifications", "Data Usage"], ["About and Help", "Tell a Friend"], ["Feedback"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items[section].count;
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return self.section.count
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if (indexPath.section == 0) {
            return 70.0
        }
        return 44.0;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CellView
        
        if (indexPath.section == 0) {
            myCell.imgView.image = UIImage(named: "images")
        }
        
        else {
            myCell.imgView.image = UIImage(named: "Settings")
        }
        myCell.headerLbl.text = self.items[indexPath.section][indexPath.row]
        
        return myCell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
