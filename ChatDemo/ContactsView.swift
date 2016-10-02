//
//  ContactsView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit
import Contacts
//import ContactsUI

class ContactsView: UIViewController, XMLParserDelegate, UITableViewDelegate  ,UITableViewDataSource {
    
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
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    
    
     var objects = [CNContact]()
    
    
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
            //    getContacts()
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
        
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        let topAnchorPlusBtn = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal,toItem:self.plusBtn, attribute: NSLayoutAttribute.top, multiplier: 1, constant:-5)
        let trailingAnchorPlusBtn = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal,toItem:self.plusBtn, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant:10)
        let widthPlusBtn = NSLayoutConstraint(item: self.plusBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:45)
        let heightPlusBtn = NSLayoutConstraint(item: self.plusBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:50)
        NSLayoutConstraint.activate([topAnchorPlusBtn , trailingAnchorPlusBtn ,widthPlusBtn , heightPlusBtn])
        
        
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        let topAnchorEditBtn = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal,toItem:self.editBtn, attribute: NSLayoutAttribute.top, multiplier: 1, constant:-5)
        let ledingAnchorEditBtn = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal,toItem:self.editBtn, attribute: NSLayoutAttribute.leading, multiplier: 1, constant:-10)
        let widthEditBtn = NSLayoutConstraint(item: self.editBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:45)
        let heightEditBtn = NSLayoutConstraint(item: self.editBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:50)
        NSLayoutConstraint.activate([topAnchorEditBtn , ledingAnchorEditBtn ,widthEditBtn , heightEditBtn])
        
        
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
    
    // For fetching Contacts
    
//    func getContacts() {
//        let store = CNContactStore()
//        
//        if CNContactStore.authorizationStatus(for: .contacts) == .notDetermined {
//            store.requestAccess(for: .contacts, completionHandler: { (authorized: Bool, error: NSError?) -> Void in
//                if authorized {
//                    self.retrieveContactsWithStore(store)
//                }
//            })
//        } else if CNContactStore.authorizationStatus(for: .contacts) == .authorized {
//            self.retrieveContactsWithStore(store)
//        }
//    }
    
    func retrieveContactsWithStore(_ store: CNContactStore) {
        
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactEmailAddressesKey,
            CNContactPhoneNumbersKey,
            CNContactImageDataAvailableKey,
            CNContactThumbnailImageDataKey] as [Any]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try store.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try store.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                objects.append(contentsOf: containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
        
        let contact = self.objects[(indexPath as NSIndexPath).row]
        let formatter = CNContactFormatter()
        
       // myCell.headerLbl.text = items[indexPath.row].name;
        
        myCell.headerLbl.text = formatter.string(from: contact)
        if isExist(myCell.headerLbl.text!) {
            myCell.descriptLbl.text = "Chat Demo Client"
        }
 //       myCell.detailTextLabel?.text = contact.emailAddresses.first?.value as? String
//        myCell.textLabel?.text = items[indexPath.row].name;
//        myCell.imageView?.image = UIImage(named: items[indexPath.row].url);
        
        return myCell;
    }
    
    func isExist(_ name: String) -> Bool {
        
        for item in items {
            if (name == item.name) {
                return true
            }
        }
        return false
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        self.performSegueWithIdentifier("segue", sender: self)
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
