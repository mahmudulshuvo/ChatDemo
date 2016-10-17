//
//  ChatsVCBase.swift
//  ChatDemo
//
//  Created by SHUVO on 10/12/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class ChatsVCBase: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var middleStack: UIStackView!
    @IBOutlet weak var topStack: UIStackView!
    
    let section = ["    ", "    "]
    let items = [["Save Incoming Media"], ["Clear All Chats", "Delete All Chats"]]
    
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
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.section.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 44.0
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44.0;
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        var tableViewFooter = UIView()
        
        if section == 0 {
            
            tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
            tableViewFooter.backgroundColor = UIColor.clear
            let label = UILabel(frame: CGRect (x:0,y:0,width:tableView.frame.width-10,height:40))
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = UIColor.darkGray
            label.textAlignment = NSTextAlignment.left
            label.lineBreakMode = NSLineBreakMode.byWordWrapping
            label.numberOfLines = 0
            label.text = "Automatically save images and video that you receive into the Camera Roll"
            
            let footerStackLabel = UIStackView()
            footerStackLabel.addArrangedSubview(label)
            
            tableViewFooter.addSubview(footerStackLabel)
            
            footerStackLabel.translatesAutoresizingMaskIntoConstraints = false
            footerStackLabel.topAnchor.constraint(equalTo: tableViewFooter.topAnchor).isActive = true
            footerStackLabel.leadingAnchor.constraint(equalTo: tableViewFooter.leadingAnchor).isActive = true
            footerStackLabel.trailingAnchor.constraint(equalTo: tableViewFooter.trailingAnchor).isActive = true
            footerStackLabel.bottomAnchor.constraint(equalTo: tableViewFooter.bottomAnchor).isActive = true
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: tableViewFooter.topAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: tableViewFooter.leadingAnchor, constant: 20).isActive = true
            label.trailingAnchor.constraint(equalTo: tableViewFooter.trailingAnchor, constant: -30).isActive = true
            label.bottomAnchor.constraint(equalTo: tableViewFooter.bottomAnchor).isActive = true
            
            return tableViewFooter
        }
        
        return tableViewFooter

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        myCell.switch.isHidden = true
        
        if (indexPath.section == 2) {
            myCell.switch.isHidden = false
        }
        
        myCell.privacyDescription.text = self.items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        
        return myCell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
