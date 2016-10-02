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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    
    let section = ["    ", "    ", "    ", "    ", "    "]
    let items = [["User"], ["Starred Messages", "WhatsApp Web/Desktop"], ["Account", "Chats", "Notifications", "Data Usage"], ["About and Help", "Tell a Friend"], ["Feedback"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraints() {
        
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        let topAnchorContainerView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal,toItem:self.containerView, attribute: NSLayoutAttribute.top, multiplier: 1, constant:0)
        let bottomAnchorContainerView = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal,toItem:self.containerView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant:0)
        let leadingAnchorContainerView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal,toItem:self.containerView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant:0)
        let trailingAnchorContainerView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal,toItem:self.containerView, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant:0)
        NSLayoutConstraint.activate([topAnchorContainerView , bottomAnchorContainerView ,leadingAnchorContainerView , trailingAnchorContainerView])
        
        self.topLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: self.containerView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal,toItem: self.topLabel, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant:0)
        let centerY = NSLayoutConstraint(item: self.containerView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal,toItem: self.topLabel, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant:0)
        NSLayoutConstraint.activate([centerX , centerY])
        
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        let topAnchorTableView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal,toItem:self.tableView, attribute: NSLayoutAttribute.top, multiplier: 1, constant:-60)
        let bottomAnchorTableView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal,toItem:self.tableView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant:60)
        let leadingAnchorTableView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal,toItem:self.tableView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant:0)
        let trailingAnchorTableView = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal,toItem:self.tableView, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant:0)
        NSLayoutConstraint.activate([topAnchorTableView , bottomAnchorTableView ,leadingAnchorTableView , trailingAnchorTableView])
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items[section].count;
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return self.section.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if ((indexPath as NSIndexPath).section == 0) {
            return 70.0
        }
        return 44.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        
        if ((indexPath as NSIndexPath).section == 0) {
            myCell.imgView.image = UIImage(named: "images")
        }
        
        else {
            myCell.imgView.image = UIImage(named: "Settings")
        }
        myCell.headerLbl.text = self.items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        
        return myCell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
