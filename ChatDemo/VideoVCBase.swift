//
//  VideoView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class VideoVCBase: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var topStack: UIStackView!
    @IBOutlet weak var displayStack: UIStackView!
    @IBOutlet weak var middleStack: UIStackView!
    @IBOutlet weak var bottomStack: UIStackView!
    
    @IBOutlet weak var middleBtnStack: UIStackView!
    @IBOutlet weak var callEndBtn: UIButton!
    @IBOutlet weak var displayView: UIView!
    
    var circleFirstHorizontalStack = UIStackView()
    var circleSecondHorizontalStack = UIStackView()
    var circleThirdHorizontalStack = UIStackView()
    var circleVerticalStack = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
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
        
        
        //Setting Circle Display Stacks
        displayStack.translatesAutoresizingMaskIntoConstraints = false
        displayStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 0).isActive = true
        displayStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        displayStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        displayStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6, constant: -50).isActive = true
        
        displayStack.addArrangedSubview(displayView)
        
        displayView.translatesAutoresizingMaskIntoConstraints = false
        displayView.topAnchor.constraint(equalTo: displayStack.topAnchor, constant: 0).isActive = true
        displayView.leadingAnchor.constraint(equalTo: displayStack.leadingAnchor, constant: 0).isActive = true
        displayView.trailingAnchor.constraint(equalTo: displayStack.trailingAnchor, constant: 0).isActive = true
        displayView.heightAnchor.constraint(equalTo: displayStack.heightAnchor).isActive = true
        
        circleFirstHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        circleFirstHorizontalStack.alignment = UIStackViewAlignment.fill
        circleFirstHorizontalStack.distribution = UIStackViewDistribution.fillEqually
        circleFirstHorizontalStack.spacing = 0.0
        circleFirstHorizontalStack.axis = .horizontal
        
        circleSecondHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        circleSecondHorizontalStack.alignment = UIStackViewAlignment.fill
        circleSecondHorizontalStack.distribution = UIStackViewDistribution.fillEqually
        circleSecondHorizontalStack.spacing = 0.0
        circleSecondHorizontalStack.axis = .horizontal
        
        circleThirdHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
        circleThirdHorizontalStack.alignment = UIStackViewAlignment.fill
        circleThirdHorizontalStack.distribution = UIStackViewDistribution.fillEqually
        circleThirdHorizontalStack.spacing = 0.0
        circleThirdHorizontalStack.axis = .horizontal
        
        circleVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        circleVerticalStack.alignment = UIStackViewAlignment.fill
        circleVerticalStack.distribution = UIStackViewDistribution.fillEqually
        circleVerticalStack.spacing = 0.0
        circleVerticalStack.axis = .vertical
        
        displayView.addSubview(circleVerticalStack)
        
        circleVerticalStack.topAnchor.constraint(equalTo: displayView.topAnchor).isActive = true
        circleVerticalStack.leadingAnchor.constraint(equalTo: displayView.leadingAnchor).isActive = true
        circleVerticalStack.trailingAnchor.constraint(equalTo: displayView.trailingAnchor).isActive = true
        circleVerticalStack.heightAnchor.constraint(equalTo: displayView.heightAnchor).isActive = true
        
        //Setting Middle Stacks
        middleStack.translatesAutoresizingMaskIntoConstraints = false
        middleStack.topAnchor.constraint(equalTo: displayStack.bottomAnchor, constant: 0).isActive = true
        middleStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        middleStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        middleStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15, constant: 0).isActive = true
        
        middleBtnStack.translatesAutoresizingMaskIntoConstraints = false
        middleBtnStack.topAnchor.constraint(equalTo: middleStack.topAnchor, constant: 0).isActive = true
        middleBtnStack.leadingAnchor.constraint(equalTo: middleStack.leadingAnchor, constant: 30).isActive = true
        middleBtnStack.trailingAnchor.constraint(equalTo: middleStack.trailingAnchor, constant: -30).isActive = true
        middleBtnStack.bottomAnchor.constraint(equalTo: middleStack.bottomAnchor, constant: 0).isActive = true
        middleStack.distribution = UIStackViewDistribution.fillEqually
        middleStack.alignment = UIStackViewAlignment.fill
        
        //Setting Bottom Stacks
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.topAnchor.constraint(equalTo: middleStack.bottomAnchor, constant: 0).isActive = true
        bottomStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        bottomStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -48).isActive = true
        
        callEndBtn.translatesAutoresizingMaskIntoConstraints = false
        callEndBtn.centerXAnchor.constraint(equalTo: bottomStack.centerXAnchor).isActive = true
        callEndBtn.centerYAnchor.constraint(equalTo: bottomStack.centerYAnchor).isActive = true
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

