//
//  ChatView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/4/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit


class ChatView: UIViewController {
    
    var passedName:String!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = passedName
    }
    
    @IBAction func bckButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
}
