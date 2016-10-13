//
//  OthersView.swift
//  ChatDemo
//
//  Created by SHUVO on 10/13/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class OthersView: UIViewController {
    

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topStack: UIStackView!

    var topLabelTxt:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()

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
        topLabel.text = topLabelTxt
        
        self.backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        backBtn.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

