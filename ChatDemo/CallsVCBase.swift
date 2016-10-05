//
//  CallsView.swift
//  ChatDemo
//
//  Created by SHUVO on 8/8/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class CallsVCBase: UIViewController {
    
    
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
    
    var circleView = UIView()
    var diameter: CGFloat = 0.0
    
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
        
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.centerYAnchor.constraint(equalTo: topStack.centerYAnchor).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: topStack.trailingAnchor, constant: -10).isActive = true
        plusBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
        plusBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        displayStack.translatesAutoresizingMaskIntoConstraints = false
        displayStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 0).isActive = true
        displayStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        displayStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        displayStack.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6, constant: -50).isActive = true
        
        displayView.translatesAutoresizingMaskIntoConstraints = false
        displayView.topAnchor.constraint(equalTo: displayStack.topAnchor, constant: 0).isActive = true
        displayView.leadingAnchor.constraint(equalTo: displayStack.leadingAnchor, constant: 0).isActive = true
        displayView.trailingAnchor.constraint(equalTo: displayStack.trailingAnchor, constant: 0).isActive = true
        displayView.bottomAnchor.constraint(equalTo: displayStack.bottomAnchor, constant: 0).isActive = true
        
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
        
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.topAnchor.constraint(equalTo: middleStack.bottomAnchor, constant: 0).isActive = true
        bottomStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        bottomStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        bottomStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -48).isActive = true
        
        callEndBtn.translatesAutoresizingMaskIntoConstraints = false
        callEndBtn.centerXAnchor.constraint(equalTo: bottomStack.centerXAnchor).isActive = true
        callEndBtn.centerYAnchor.constraint(equalTo: bottomStack.centerYAnchor).isActive = true
        
    }

    
    @IBAction func drawCircle(_ sender: AnyObject) {
        
        diameter = min(self.displayView.frame.size.width, self.displayView.frame.size.height) * 0.6;
        circleView.frame = CGRect(x :100,
                                     y :100,
                                     width :diameter, height :diameter);
        circleView.layer.cornerRadius = diameter / 2;
        circleView.clipsToBounds = true
        circleView.layer.borderColor = UIColor.blue.cgColor
        circleView.layer.borderWidth = 1.0
        displayView.addSubview(circleView)
      //  displayStack.addArrangedSubview(displayView)
        
        circleView.centerXAnchor.constraint(equalTo: displayView.centerXAnchor, constant: 0).isActive = true
        circleView.centerYAnchor.constraint(equalTo: displayView.centerYAnchor, constant: 0).isActive = true
        circleView.widthAnchor.constraint(equalTo: displayView.widthAnchor, multiplier: 0.25, constant: diameter).isActive = true
        circleView.heightAnchor.constraint(equalTo: displayView.heightAnchor, multiplier: 0.25, constant: diameter).isActive = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
