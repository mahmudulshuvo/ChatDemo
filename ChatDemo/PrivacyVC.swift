//
//  AccountsVC.swift
//  ChatDemo
//
//  Created by SHUVO on 10/12/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class PrivacyVC: PrivacyVCBase {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // printDemo()
    }
    
    @IBAction func myUnwindActionPrivacy(unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? PrivacyDetailsVCBase {
            lastSeenLbl = sourceViewController.lastSeenLbl
            proPhotoLbl = sourceViewController.proPhotoLbl
            stausLbl = sourceViewController.stausLbl
            tableView.reloadData()
        }
        
    }
    
}
