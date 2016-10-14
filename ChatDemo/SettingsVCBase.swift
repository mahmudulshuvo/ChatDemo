//
//  SettingsView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class SettingsVCBase: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var middleStack: UIStackView!
    
    var topLabelTxt:String = ""
    let section = ["    ", "    ", "    "]
    let items = [["User"], ["Account", "Chats", "Notifications", "Data Usage"], ["About and Help"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupConstraints() {
        
        // //Setting Up Top
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        topStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.centerXAnchor.constraint(equalTo: topStack.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        
        middleStack.translatesAutoresizingMaskIntoConstraints = false
        middleStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 0).isActive = true
        middleStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        middleStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        middleStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.9, constant: -50).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: middleStack.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: middleStack.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: middleStack.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: middleStack.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 4)
        {
            //return 100;
            return CGFloat.leastNormalMagnitude;
        }
        else
        {
            return CGFloat.leastNormalMagnitude;
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let section:Int = indexPath.section
        let row:Int = indexPath.row
        let identifier:String = self.items[section][row]
        
        print("Identifier value \(identifier)")
        topLabelTxt = identifier
        
        if (identifier == "User" || identifier == "Data Usage" || identifier == "About and Help") {
            self.performSegue(withIdentifier: "others", sender: indexPath)
        }
        else {
            self.performSegue(withIdentifier: identifier, sender: indexPath)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Account", let _ = segue.destination as? AccountsVCBase {

        }
        
        else if segue.identifier == "Chats", let _ = segue.destination as? ChatVCBase {
        }
        
        else if segue.identifier == "Notifications", let _ = segue.destination as? NotificationsVC {
        }
        
        else if segue.identifier == "others", let destinationVC = segue.destination as? OthersView {
            destinationVC.topLabelTxt = topLabelTxt
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
