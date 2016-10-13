//
//  CallsVC.swift
//  ChatDemo
//
//  Created by SHUVO on 10/3/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class CallsVC: CallsVCBase {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    
    @IBAction func muteBtnAction(_ sender: AnyObject) {
        
        print("Mute Button Tapped")
    }
    
    @IBAction func videoBtnAction(_ sender: AnyObject) {
        
         print("Video Button Tapped")
    }
    
    @IBAction func speakerBtnAction(_ sender: AnyObject) {
        
         print("Speaker Button Tapped")
    }
    
    @IBAction func callBtnAction(_ sender: AnyObject) {
        
        print("Call Button Tapped")
    }
    
}
