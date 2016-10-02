//
//  CallsView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class CallsView: UIViewController, XMLParserDelegate, UITableViewDelegate  ,UITableViewDataSource {
    
    struct Item {
        let name: String
        let url: String
    }
    
    var itemName: String?
    var itemUrl: String?
    var items: [Item]!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        var parser: XMLParser?
        let path = Bundle.main.path(forResource: "Contacts", ofType: "xml")
        if path != nil
        {
            parser = XMLParser(contentsOf: URL(fileURLWithPath: path!))
            parser?.delegate = self
            parser?.parse()
            if parser != nil
            {
                print(items)
                tableView.dataSource = self
                tableView.delegate = self
            }
        }
        else
        {
            NSLog("Failed to find Contacts.xml")
        }
        
        
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
        
        
        
//        let width = NSLayoutConstraint(item: self.plusBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:45)
//        let height = NSLayoutConstraint(item: self.plusBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:50)
        
        
    }
    
    func parserDidStartDocument(_ parser: XMLParser) {
        items = []
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "item" {
            itemUrl = attributeDict["imgUrl"]
            itemName = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        itemName?.append(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            items.append(Item(name: itemName!, url: itemUrl!))
            itemName = nil
            itemUrl = nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        myCell.headerLbl.text = items[(indexPath as NSIndexPath).row].name
        print("names : \(items[(indexPath as NSIndexPath).row].name)")
        
        return myCell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
