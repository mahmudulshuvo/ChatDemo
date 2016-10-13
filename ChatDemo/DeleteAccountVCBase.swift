//
//  AccountsVCBase.swift
//  ChatDemo
//
//  Created by SHUVO on 10/12/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class DeleteAccountVCBase: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var middleStack: UIStackView!
    @IBOutlet weak var topStack: UIStackView!
    
    let section = ["    "]
    let items = [["Delete My Account"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
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
        
        return CGFloat.leastNormalMagnitude
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.section[section]
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
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        myCell.textLabel?.text  = self.items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        
        return myCell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
