//
//  AccountsVCBase.swift
//  ChatDemo
//
//  Created by SHUVO on 10/12/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class PrivacyVCBase: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!

    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var middleStack: UIStackView!
    
    var valueToPass: String = ""
    var lastSeenLbl:String = ""
    var proPhotoLbl:String = ""
    var stausLbl:String = ""
    
    let section = ["    ", "    ", "    "]
    let items = [["Last Seen", "Profile Photo", "Status"], ["Blocked"], ["Read Receipts"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setupConstraints() {
        
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        topStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.centerXAnchor.constraint(equalTo: topStack.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
         
        self.backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        middleStack.translatesAutoresizingMaskIntoConstraints = false
        middleStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 0).isActive = true
        middleStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        middleStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        middleStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.9, constant: -50).isActive = true
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        
        if  section == 2 {
            return 100
        }
//
//        else {
//            return 35
//        }
        return CGFloat.leastNormalMagnitude
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return self.section[section]
        
    }
    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//
////        return self.section[section]
//        
////        if section == 1 {
////            return "List of contacts you have blocked"
////        }
////        
////        if section == 2 {
////            return "If you turn off read receipts, you won't \nbe able to see read receipts from other \npeople. Read receipts are always sent \nfor group chats"
////        }
////        return ""
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        var tableViewFooter = UIView()
        
        if section == 1 {
            
            tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
            tableViewFooter.backgroundColor = UIColor.clear
            let firstLabel = UILabel(frame: CGRect (x:0,y:0,width:tableView.frame.width-10,height:100))
            firstLabel.font = UIFont.systemFont(ofSize: 18)
            firstLabel.textColor = UIColor.darkGray
            firstLabel.textAlignment = NSTextAlignment.left
            firstLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            firstLabel.numberOfLines = 0
            firstLabel.text = "List of contacts you have blocked"
            tableViewFooter.addSubview(firstLabel)
            
            firstLabel.translatesAutoresizingMaskIntoConstraints = false
            firstLabel.centerYAnchor.constraint(equalTo: tableViewFooter.centerYAnchor, constant: 20).isActive = true
            firstLabel.leadingAnchor.constraint(equalTo: tableViewFooter.leadingAnchor, constant: 20).isActive = true
            return tableViewFooter
        }
        
        if section == 2 {
            
            tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
            tableViewFooter.backgroundColor = UIColor.clear
            let secondLabel = UILabel(frame: CGRect (x:0,y:0,width:tableView.frame.width-10,height:100))
            secondLabel.font = UIFont.systemFont(ofSize: 18)
            secondLabel.textColor = UIColor.darkGray
            secondLabel.textAlignment = NSTextAlignment.left
            secondLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            secondLabel.numberOfLines = 4
            secondLabel.text = "If you turn off read receipts, you won't be able to see read receipts from other people. Read receipts are always sent for group chats."
            
            let footerStackLabel = UIStackView()
            footerStackLabel.addArrangedSubview(secondLabel)
            
            tableViewFooter.addSubview(footerStackLabel)
            
            footerStackLabel.translatesAutoresizingMaskIntoConstraints = false
            footerStackLabel.topAnchor.constraint(equalTo: tableViewFooter.topAnchor).isActive = true
            footerStackLabel.leadingAnchor.constraint(equalTo: tableViewFooter.leadingAnchor).isActive = true
            footerStackLabel.trailingAnchor.constraint(equalTo: tableViewFooter.trailingAnchor).isActive = true
            footerStackLabel.bottomAnchor.constraint(equalTo: tableViewFooter.bottomAnchor).isActive = true
            
            secondLabel.translatesAutoresizingMaskIntoConstraints = false
            secondLabel.topAnchor.constraint(equalTo: tableViewFooter.topAnchor).isActive = true
            secondLabel.leadingAnchor.constraint(equalTo: tableViewFooter.leadingAnchor, constant: 20).isActive = true
            secondLabel.trailingAnchor.constraint(equalTo: tableViewFooter.trailingAnchor, constant: -30).isActive = true
            secondLabel.bottomAnchor.constraint(equalTo: tableViewFooter.bottomAnchor).isActive = true

            return tableViewFooter
        }
        
        return tableViewFooter
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.section.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        return 44.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        myCell.switch.isHidden = true
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                myCell.statusLbl.text = lastSeenLbl
            }
            if (indexPath.row == 1) {
                myCell.statusLbl.text = proPhotoLbl
            }
            if (indexPath.row == 2) {
                myCell.statusLbl.text = stausLbl
            }}
        
        if (indexPath.section == 1) {
            myCell.statusLbl.text = "None"
        }
        
        if (indexPath.section == 2) {
            myCell.statusLbl.isHidden = true
            myCell.switch.isHidden = false
            myCell.accessoryType = .none
        }
        
        myCell.privacyDescription.text  = self.items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        
        return myCell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 0) {
            
            let identifier:String = "privacyDetails"
            valueToPass = items[indexPath.section][indexPath.row]
            
            print("Identifier value \(identifier)")
            
            self.performSegue(withIdentifier: identifier, sender: indexPath)
        }
        
        if (indexPath.section == 1) {
            
            let identifier:String = "privacyBlocked"
            valueToPass = items[indexPath.section][indexPath.row]
            
            print("Identifier value \(identifier)")
            
            self.performSegue(withIdentifier: identifier, sender: indexPath)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "privacyDetails", let destinationVC = segue.destination as? PrivacyDetailsVCBase {
            
            destinationVC.topLabelTxt = valueToPass
            destinationVC.lastSeenLbl = lastSeenLbl
            destinationVC.proPhotoLbl = proPhotoLbl
            destinationVC.stausLbl = stausLbl
        }
        
        if segue.identifier == "privacyBlocked", let destinationVC = segue.destination as? BlockVCBase {
            
            destinationVC.topLabelTxt = valueToPass
            
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
