//
//  ViewController.swift
//  ChatDemo
//
//  Created by SHUVO on 8/4/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController, UITableViewDelegate  ,UITableViewDataSource {
    
//    struct Item {
//        let name: String
//        let url: String
//    }
//    
//    var itemName: String?
//    var itemUrl: String?
//    var items: [Item]!
    
    @IBOutlet weak var tableView: UITableView!
    var objects = [CNContact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
        tableView.dataSource = self
        tableView.delegate = self
        
//        var parser: NSXMLParser?
//        let path = NSBundle.mainBundle().pathForResource("Contacts", ofType: "xml")
//        if path != nil
//        {
//            parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path!))
//            parser?.delegate = self
//            parser?.parse()
//            if parser != nil
//            {
//                print(items)
//                tableView.dataSource = self
//                tableView.delegate = self
//            }
//        }
//        else
//        {
//            NSLog("Failed to find Contacts.xml")
//        }
        
        
    }
    
    
    // For XML persing
    
//    func parserDidStartDocument(parser: NSXMLParser) {
//        items = []
//    }
//    
//    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
//        if elementName == "item" {
//            itemUrl = attributeDict["imgUrl"]
//            itemName = ""
//        }
//    }
//    
//    func parser(parser: NSXMLParser, foundCharacters string: String) {
//        itemName?.appendContentsOf(string)
//    }
//    
//    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == "item" {
//            items.append(Item(name: itemName!, url: itemUrl!))
//            itemName = nil
//            itemUrl = nil
//        }
//    }
    
    
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
    
    
    // For table view
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
//        let myCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
//        myCell.textLabel?.text = items[indexPath.row].name;
//        myCell.imageView?.image = UIImage(named: items[indexPath.row].url);
//        
//        return myCell;
       
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let contact = self.objects[indexPath.row]
        let formatter = CNContactFormatter()
        
        cell.textLabel?.text = formatter.stringFromContact(contact)
        cell.detailTextLabel?.text = contact.emailAddresses.first?.value as? String
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("segue", sender: self)
    }
    
    // For Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segue") {
            let svc = segue.destinationViewController as! ChatView;
            let indexPath = tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
            svc.passedName = currentCell.textLabel!.text
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

