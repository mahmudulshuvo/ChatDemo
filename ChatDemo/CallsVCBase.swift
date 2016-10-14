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
    
    var circleFirstHorizontalStack = UIStackView()
    var circleSecondHorizontalStack = UIStackView()
//    var circleThirdHorizontalStack = UIStackView()
    var circleVerticalStack = UIStackView()
    
    var circleView = [UIView]()
    var testView = [UIView]()
    var diameter: CGFloat = 0.0
    var counter: Int = -1
    var check: Bool = false
    var checkPortrait: Bool = false
    var checkLandScape: Bool = false
    var orientationCounter: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupConstraints()
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
                NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(self.orientationChanged(notification:)),
                    name: NSNotification.Name.UIDeviceOrientationDidChange,
                    object: nil)
        
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
        
        
        // Diameter Calculation
        
        diameter = min(displayView.frame.size.width, displayView.frame.size.height) * 0.4
        
        
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
        
//        circleThirdHorizontalStack.translatesAutoresizingMaskIntoConstraints = false
//        circleThirdHorizontalStack.alignment = UIStackViewAlignment.fill
//        circleThirdHorizontalStack.distribution = UIStackViewDistribution.fillEqually
//        circleThirdHorizontalStack.spacing = 0.0
//        circleThirdHorizontalStack.axis = .horizontal
        
        circleVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        circleVerticalStack.alignment = UIStackViewAlignment.fill
        circleVerticalStack.distribution = UIStackViewDistribution.fillProportionally
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

    
    func orientationChanged(notification : NSNotification) {
        
        if UIScreen.main.bounds.height < UIScreen.main.bounds.width {
            
            // LandScape Mode
            checkLandScape = true
            checkPortrait = false
            if counter > 0 {
                setUpCircles()
            }
            
        }
        
        else {
            
            // Portrait Mode
            checkPortrait = true
            checkLandScape = false
            if counter > 0 {
                setUpCircles()
            }
            
        }

    }
    
    
    func setUpCircles() {

        if checkPortrait {
            print("On portrait")
            checkLandScape = false
            
            circleVerticalStack.axis = .vertical
            
             for i in 0 ..< counter+1
             {
                
                if (i == 0 || i == 1) {
                    circleFirstHorizontalStack.removeArrangedSubview(testView[i])
                    
                    if i == 0 {
                        circleVerticalStack.removeArrangedSubview(circleFirstHorizontalStack)
                    }
                    if i == 1 {
                        circleFirstHorizontalStack.removeFromSuperview()
                    }
                }
                
                if (i == 2 || i == 3) {
                    circleSecondHorizontalStack.removeArrangedSubview(testView[i])
                    if i == 2 {
                        circleVerticalStack.removeArrangedSubview(circleSecondHorizontalStack)
                    }
                    if i == 3 {
                        circleSecondHorizontalStack.removeFromSuperview()
                    }
                }
                
//                if (i == 4 || i == 5) {
//                    circleThirdHorizontalStack.removeArrangedSubview(testView[i])
//                    if i == 4 {
//                        circleVerticalStack.removeArrangedSubview(circleThirdHorizontalStack)
//                    }
//                    
//                    if i == 5 {
//                        circleThirdHorizontalStack.removeFromSuperview()
//                    }
//                }
                
                circleVerticalStack.removeArrangedSubview(testView[i])
                testView[i].removeFromSuperview()
            }
            
            for i in 0 ..< counter+1
            {
                
                if (i == 0 || i == 1) {
                    circleFirstHorizontalStack.addArrangedSubview(testView[i])

                    if i == 0 {
                        circleVerticalStack.addArrangedSubview(circleFirstHorizontalStack)
                        displayView.addSubview(circleVerticalStack)
                    }
                }
                
                if (i == 2 || i == 3) {
                    
                    circleSecondHorizontalStack.addArrangedSubview(testView[i])
                
                    if i == 2 {
                        circleVerticalStack.addArrangedSubview(circleSecondHorizontalStack)
                    }
                }
                
//                if (i == 4 || i == 5) {
//                    circleThirdHorizontalStack.addArrangedSubview(testView[i])
//                    if i == 4 {
//                        circleVerticalStack.addArrangedSubview(circleThirdHorizontalStack)
//                    }
//                }
            }
            
            
        }
        
        
        
        if checkLandScape {
            checkPortrait = false
            
            print("On Landscape")
            
            circleVerticalStack.axis = .horizontal
            
            for i in 0 ..< counter+1
            {
              //  print("I value \(i) and counter \(counter)")
                if (i == 0 || i == 1) {
                    circleFirstHorizontalStack.removeArrangedSubview(testView[i])
                    
                    if i == 0 {
                        circleVerticalStack.removeArrangedSubview(circleFirstHorizontalStack)
                    }
                    if i == 1 {
                        circleFirstHorizontalStack.removeFromSuperview()
                    }
                }
                
                if (i == 2 || i == 3) {
                    circleSecondHorizontalStack.removeArrangedSubview(testView[i])
                    if i == 2 {
                        circleVerticalStack.removeArrangedSubview(circleSecondHorizontalStack)
                    }
                    if i == 3 {
                        circleSecondHorizontalStack.removeFromSuperview()
                    }
                }
                
//                if (i == 4 || i == 5) {
//                    circleThirdHorizontalStack.removeArrangedSubview(testView[i])
//                    if i == 4 {
//                        circleVerticalStack.removeArrangedSubview(circleThirdHorizontalStack)
//                    }
//                    
//                    if i == 5 {
//                        circleThirdHorizontalStack.removeFromSuperview()
//                    }
//                }
                
                circleVerticalStack.removeArrangedSubview(testView[i])
                testView[i].removeFromSuperview()
            }
            
            for i in 0 ..< counter+1
            {
                circleVerticalStack.addArrangedSubview(testView[i])
                
            }
            
            
        }
        
    }
    
    
    @IBAction func drawCircle(_ sender: AnyObject) {
        
        
        if (counter < 3) {
            counter += 1
            if (counter == 2 || counter == 4) {
                
                diameter = diameter/1.2
                check = true
            }
            
            if check
            {
                for i in 0 ..< counter {
                    circleView[i].layer.cornerRadius = diameter/2
                    circleView[i].translatesAutoresizingMaskIntoConstraints = false
                    circleView[i].widthAnchor.constraint(equalToConstant: diameter).isActive = true
                    circleView[i].heightAnchor.constraint(equalToConstant: diameter).isActive = true
                }
                check = false
            }

            testView.append(UIView())
            testView[counter].frame = CGRect(x :0, y :0, width :100, height :100)
            testView[counter].backgroundColor = UIColor.clear
            circleView.append(UIView())
            circleView[counter].frame = CGRect(x :0, y :0, width :diameter, height :diameter)
            circleView[counter].layer.cornerRadius = diameter/2
            circleView[counter].clipsToBounds = true
            circleView[counter].layer.borderColor = UIColor.white.cgColor
            circleView[counter].layer.borderWidth = 1.0
            circleView[counter].backgroundColor = UIColor.black
            testView[counter].addSubview(circleView[counter])
           // displayView.addSubview(circleVerticalStack)

            
            circleView[counter].translatesAutoresizingMaskIntoConstraints = false
            circleView[counter].centerXAnchor.constraint(equalTo: testView[counter].centerXAnchor).isActive = true
            circleView[counter].centerYAnchor.constraint(equalTo: testView[counter].centerYAnchor).isActive = true
            circleView[counter].widthAnchor.constraint(equalToConstant: diameter).isActive = true
            circleView[counter].heightAnchor.constraint(equalToConstant: diameter).isActive = true

            setUpCircles()

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


