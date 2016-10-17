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
//    @IBOutlet weak var headerStack: UIStackView!
//    @IBOutlet weak var headerImgView: UIImageView!
//    @IBOutlet weak var headerTitleLabel: UILabel!
//    
//    @IBOutlet weak var headerMidLabel: UILabel!
//    @IBOutlet weak var headerEndLabel: UILabel!
//    @IBOutlet weak var headerView: UIView!
//    var scrollView: UIScrollView!
    
    let section = ["    ", "    "]
    let items = [["United States", ""], ["Delete My Account"]]
    
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
        
        
//        headerStack.translatesAutoresizingMaskIntoConstraints = false
//        headerStack.topAnchor.constraint(equalTo: middleStack.topAnchor, constant: 0).isActive = true
//        headerStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
//        headerStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
//        headerStack.heightAnchor.constraint(equalTo: self.middleStack.heightAnchor, multiplier: 0.3, constant: 0).isActive = true
//        
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.topAnchor.constraint(equalTo: headerStack.topAnchor, constant: 0).isActive = true
//        headerView.leadingAnchor.constraint(equalTo: headerStack.leadingAnchor, constant: 0).isActive = true
//        headerView.trailingAnchor.constraint(equalTo: headerStack.trailingAnchor, constant: 0).isActive = true
//        headerView.heightAnchor.constraint(equalTo: headerStack.heightAnchor, constant: 0).isActive = true
//
//        
//        headerImgView.translatesAutoresizingMaskIntoConstraints = false
//        headerImgView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
//        headerImgView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
//        headerImgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        headerImgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        
//        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerTitleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 60).isActive = true
//        headerTitleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
//        headerTitleLabel.widthAnchor.constraint(equalToConstant: 230).isActive = true
//        headerTitleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
//        
//        headerMidLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerMidLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 85).isActive = true
//        headerMidLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30).isActive = true
//        headerMidLabel.widthAnchor.constraint(equalToConstant: 284).isActive = true
//        headerMidLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
//        
//        headerEndLabel.translatesAutoresizingMaskIntoConstraints = false
//        headerEndLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 145).isActive = true
//        headerEndLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
//        headerEndLabel.widthAnchor.constraint(equalToConstant: 214).isActive = true
//        headerEndLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: middleStack.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: middleStack.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: middleStack.bottomAnchor, constant: 0).isActive = true
        
        
//        scrollView = UIScrollView(frame: headerView.bounds)
//        scrollView.backgroundColor = UIColor.clear
//        scrollView.contentSize = headerView.bounds.size
//        scrollView.autoresizingMask = UIViewAutoresizing.flexibleWidth
//        scrollView.addSubview(headerView)
//        self.view.addSubview(scrollView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 185
        }
        
        else {
            return 35
        }
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//      //  return self.section[section]
//        return "Enter your phone number"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var tableViewHeader = UIView()
        
        if section == 0 {
            print("In view for header in section")
            tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 185))
            tableViewHeader.backgroundColor = UIColor.init(red: 0.93, green: 0.93, blue: 0.95, alpha: 1.0)
            
            var deleteIconView = UIImageView(frame: CGRect (x:0,y:0,width:50,height:50))
            deleteIconView = UIImageView(image: #imageLiteral(resourceName: "warning.png"))
            deleteIconView.contentMode = .scaleAspectFit
            tableViewHeader.addSubview(deleteIconView)
            deleteIconView.translatesAutoresizingMaskIntoConstraints = false
            deleteIconView.centerXAnchor.constraint(equalTo: tableViewHeader.centerXAnchor).isActive = true
            deleteIconView.topAnchor.constraint(equalTo: tableViewHeader.topAnchor).isActive = true
            
            let firstLabel = UILabel(frame: CGRect (x:0,y:0,width:tableView.frame.width-10,height:100))
            firstLabel.font = UIFont.systemFont(ofSize: 18)
            firstLabel.textColor = UIColor.darkGray
            firstLabel.textAlignment = NSTextAlignment.left
            firstLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            firstLabel.numberOfLines = 0
            firstLabel.text = "Deleting your account will: "
            tableViewHeader.addSubview(firstLabel)
            firstLabel.translatesAutoresizingMaskIntoConstraints = false
            firstLabel.topAnchor.constraint(equalTo: deleteIconView.bottomAnchor, constant: 10).isActive = true
            firstLabel.leadingAnchor.constraint(equalTo: tableViewHeader.leadingAnchor, constant: 20).isActive = true
            
            let secondLabel = UILabel(frame: CGRect (x:0,y:0,width:tableView.frame.width-100,height:100))
            secondLabel.font = UIFont.systemFont(ofSize: 14)
            secondLabel.textColor = UIColor.darkGray
            secondLabel.textAlignment = NSTextAlignment.left
            secondLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            secondLabel.numberOfLines = 3
            secondLabel.text = "• Delete your account info and profile photo \n• Delete you from all whatApp groups \n• Delete your message history on this phone"
            tableViewHeader.addSubview(secondLabel)
            secondLabel.translatesAutoresizingMaskIntoConstraints = false
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20).isActive = true
            secondLabel.leadingAnchor.constraint(equalTo: tableViewHeader.leadingAnchor, constant: 20).isActive = true
            
            let thirdLabel = UILabel(frame: CGRect (x:0,y:0,width:tableView.frame.width-100,height:100))
            thirdLabel.font = UIFont.systemFont(ofSize: 14)
            thirdLabel.textColor = UIColor.lightGray
            thirdLabel.textAlignment = NSTextAlignment.left
            thirdLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            thirdLabel.numberOfLines = 0
            thirdLabel.text = "ENTER YOUR PHONE NUMBER:"
            tableViewHeader.addSubview(thirdLabel)
            thirdLabel.translatesAutoresizingMaskIntoConstraints = false
            thirdLabel.bottomAnchor.constraint(equalTo: tableViewHeader.bottomAnchor, constant: 0).isActive = true
            thirdLabel.leadingAnchor.constraint(equalTo: tableViewHeader.leadingAnchor, constant: 20).isActive = true
            
            
            return tableViewHeader 

        }
        return tableViewHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.section.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 54.0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        if (indexPath.section == 0 && indexPath.row == 1) {
            myCell.countryCodeLabel.isHidden = false
            myCell.phoneNumberField.isHidden = false
            myCell.separatorView.isHidden = false
            myCell.countryCodeLabel.text = "+1"
            myCell.phoneNumberField.text = "your phone number"
        }
        else {
            
            if (indexPath.section == 0 && indexPath.row == 0) {
                myCell.countryCodeLabel.isHidden = true
                myCell.phoneNumberField.isHidden = true
                myCell.textLabel?.text  = self.items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
                myCell.textLabel?.textColor = UIColor.init(red: 0.082, green: 0.492, blue: 0.98, alpha: 1.0)
                myCell.accessoryType = .disclosureIndicator
            }
            else {
                myCell.countryCodeLabel.isHidden = true
                myCell.phoneNumberField.isHidden = true
                myCell.textLabel?.text  = self.items[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
                myCell.textLabel?.textColor = UIColor.red
                myCell.textLabel?.textAlignment = .center
                myCell.textLabel?.font = UIFont.systemFont(ofSize: 25)
            }
        }
        
        return myCell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
