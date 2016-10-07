//
//  CallsVC.swift
//  ChatDemo
//
//  Created by SHUVO on 10/3/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class VideoVC: VideoVCBase  {
    
    var circleView = [UIView]()
    var diameter: CGFloat = 0.0
    var counter: Int = 0
    var check: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Diameter Calculation
        
        diameter = min(displayView.frame.size.width, displayView.frame.size.height) * 0.5
    }
    
    
    @IBAction func drawCircle(_ sender: AnyObject) {
        
        
        if (counter < 4) {
            
            if (counter == 2) {
                
                diameter = diameter/1.2
                check = true
            }
            
            if check
            {
                for i in 0 ..< counter {
                    circleView[i].layer.cornerRadius = diameter/2
                    circleView[i].translatesAutoresizingMaskIntoConstraints = false
                    //                    circleView[i].centerXAnchor.constraint(equalTo: circleView[i].centerXAnchor).isActive = true
                    //                    circleView[i].centerYAnchor.constraint(equalTo: circleView[i].centerYAnchor).isActive = true
                    circleView[i].widthAnchor.constraint(equalToConstant: diameter).isActive = true
                    circleView[i].heightAnchor.constraint(equalToConstant: diameter).isActive = true
                }
                check = false
            }
            
            let testView = UIView()
            testView.frame = CGRect(x :0, y :0, width :displayView.frame.width, height :displayView.frame.height)
            testView.backgroundColor = UIColor.gray
            circleView.append(UIView())
            circleView[counter].frame = CGRect(x :0, y :0, width :diameter, height :diameter)
            circleView[counter].layer.cornerRadius = diameter/2
            circleView[counter].clipsToBounds = true
            circleView[counter].layer.borderColor = UIColor.white.cgColor
            circleView[counter].layer.borderWidth = 3.0
            circleView[counter].backgroundColor = UIColor.black
            testView.addSubview(circleView[counter])
            
            if (counter == 0 || counter == 1) {
                circleFirstHorizontalStack.addArrangedSubview(testView)
                if  (counter == 0) {
                    circleVerticalStack.addArrangedSubview(circleFirstHorizontalStack)
                    displayView.addSubview(circleVerticalStack)
                }
            }
            else if (counter == 2 || counter == 3) {
                circleSecondHorizontalStack.addArrangedSubview(testView)
                if  (counter == 2) {
                    circleVerticalStack.addArrangedSubview(circleSecondHorizontalStack)
                }
            }
            else {
                circleThirdHorizontalStack.addArrangedSubview(testView)
                if  (counter == 4) {
                    circleVerticalStack.addArrangedSubview(circleThirdHorizontalStack)
                }
            }
            
            circleView[counter].translatesAutoresizingMaskIntoConstraints = false
            circleView[counter].centerXAnchor.constraint(equalTo: testView.centerXAnchor).isActive = true
            circleView[counter].centerYAnchor.constraint(equalTo: testView.centerYAnchor).isActive = true
            circleView[counter].widthAnchor.constraint(equalToConstant: diameter).isActive = true
            circleView[counter].heightAnchor.constraint(equalToConstant: diameter).isActive = true
            counter += 1
        }
        
        
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
