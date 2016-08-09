//
//  ContactsView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ContactsView: UIViewController, NSXMLParserDelegate, UITableViewDelegate  ,UITableViewDataSource {
    
    struct Item {
        let name: String
        let url: String
    }
    
    var itemName: String?
    var itemUrl: String?
    var items: [Item]!
    
    @IBOutlet weak var tableView: UITableView!
     var objects = [CNContact]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var parser: NSXMLParser?
        let path = NSBundle.mainBundle().pathForResource("Contacts", ofType: "xml")
        if path != nil
        {
            parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path!))
            parser?.delegate = self
            parser?.parse()
            if parser != nil
            {
                print(items)
                tableView.dataSource = self
                tableView.delegate = self
                getContacts()
            }
        }
        else
        {
            NSLog("Failed to find Contacts.xml")
        }
        
        
    }
    
    func parserDidStartDocument(parser: NSXMLParser) {
        items = []
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "item" {
            itemUrl = attributeDict["imgUrl"]
            itemName = ""
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        itemName?.appendContentsOf(string)
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            items.append(Item(name: itemName!, url: itemUrl!))
            itemName = nil
            itemUrl = nil
        }
    }
    
    // For fetching Contacts
    
    func getContacts() {
        let store = CNContactStore()
        
        if CNContactStore.authorizationStatusForEntityType(.Contacts) == .NotDetermined {
            store.requestAccessForEntityType(.Contacts, completionHandler: { (authorized: Bool, error: NSError?) -> Void in
                if authorized {
                    self.retrieveContactsWithStore(store)
                }
            })
        } else if CNContactStore.authorizationStatusForEntityType(.Contacts) == .Authorized {
            self.retrieveContactsWithStore(store)
        }
    }
    
    func retrieveContactsWithStore(store: CNContactStore) {
        
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName),
            CNContactEmailAddressesKey,
            CNContactPhoneNumbersKey,
            CNContactImageDataAvailableKey,
            CNContactThumbnailImageDataKey]
        
        // Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try store.containersMatchingPredicate(nil)
        } catch {
            print("Error fetching containers")
        }
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainerWithIdentifier(container.identifier)
            
            do {
                let containerResults = try store.unifiedContactsMatchingPredicate(fetchPredicate, keysToFetch: keysToFetch)
                objects.appendContentsOf(containerResults)
            } catch {
                print("Error fetching results for container")
            }
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CellView
        
        let contact = self.objects[indexPath.row]
        let formatter = CNContactFormatter()
        
       // myCell.headerLbl.text = items[indexPath.row].name;
        
        myCell.headerLbl.text = formatter.stringFromContact(contact)
        if isExist(myCell.headerLbl.text!) {
            myCell.descriptLbl.text = "Chat Demo Client"
        }
 //       myCell.detailTextLabel?.text = contact.emailAddresses.first?.value as? String
//        myCell.textLabel?.text = items[indexPath.row].name;
//        myCell.imageView?.image = UIImage(named: items[indexPath.row].url);
        
        return myCell;
    }
    
    func isExist(name: String) -> Bool {
        
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
