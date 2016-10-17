//
//  CellView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/9/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {
    
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var descriptLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var privacyDescription: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var selectionMark: UIImageView!
    @IBOutlet weak var phoneNumberField: UITextView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var countryNameField: UILabel!
    @IBOutlet weak var separatorView: UIView!
}
