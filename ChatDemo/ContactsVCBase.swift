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

class ContactsVCBase: UIViewController, XMLParserDelegate, UITableViewDelegate  ,UITableViewDataSource {
    
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
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var middleStack: UIStackView!
    
    
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
        
        // //Setting Up Top
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        topStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1, constant: 0).isActive = true
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.centerXAnchor.constraint(equalTo: topStack.centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: topStack.trailingAnchor, constant: -10).isActive = true
        plusBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
        plusBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        editBtn.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        editBtn.leadingAnchor.constraint(equalTo: topStack.leadingAnchor, constant: 10).isActive = true
        editBtn.widthAnchor.constraint(equalToConstant: 60).isActive = true
        editBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
