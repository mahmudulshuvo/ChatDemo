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
    
    @IBOutlet weak var call: UIImageView!
    @IBOutlet weak var speaker: UIImageView!
    @IBOutlet weak var video: UIImageView!
    @IBOutlet weak var mute: UIImageView!
    

    @IBOutlet weak var displayView: UIView!
    var circleView = UIView()
    var diameter: CGFloat = 0.0
    
    var screenSize: CGSize = CGSize(width: 20, height: 30)
    var counter:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       setupConstraints()
        
    }
    
    @IBAction func drawCircle(_ sender: AnyObject) {
        
        if counter == 0 {
            counter += 1
            diameter = min(self.displayView.frame.size.width, self.displayView.frame.size.height) * 0.6;
            circleView.frame = CGRect(x :0,
                                      y :0,
                                      width :diameter, height :diameter);
            circleView.layer.cornerRadius = diameter / 2;
            circleView.clipsToBounds = true
            circleView.layer.borderColor = UIColor.blue.cgColor
            circleView.layer.borderWidth = 1.0
            self.displayView.addSubview(circleView)
            
            circleView.translatesAutoresizingMaskIntoConstraints = false
            circleView.centerXAnchor.constraint(equalTo: displayView.centerXAnchor).isActive = true
            circleView.centerYAnchor.constraint(equalTo: displayView.centerYAnchor).isActive = true
            circleView.widthAnchor.constraint(equalToConstant: diameter).isActive = true
            circleView.heightAnchor.constraint(equalToConstant: diameter).isActive = true
        }

    }
    
    
    func setupConstraints() {
        
//        print("called \(-(screenSize.height * 0.5))")
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
//        containerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
//        containerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
//        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        
//        topLabel.translatesAutoresizingMaskIntoConstraints = false
//        topLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
//        topLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//        
//        plusBtn.translatesAutoresizingMaskIntoConstraints = false
//        plusBtn.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//        plusBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
//        plusBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
//        plusBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        mute.translatesAutoresizingMaskIntoConstraints = false
//        mute.bottomAnchor.constraint(equalTo: self.view.readableContentGuide.bottomAnchor, constant: -200).isActive = true
//        mute.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:20).isActive = true
//        mute.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        mute.heightAnchor.constraint(equalToConstant: 70).isActive = true
//      //mute.heightAnchor.constraint(equalTo: , multiplier: , constant: )
//        
//        video.translatesAutoresizingMaskIntoConstraints = false
//        video.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:-200).isActive = true
//        video.leadingAnchor.constraint(equalTo: mute.trailingAnchor, constant:55).isActive = true
//        video.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        video.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        
//        speaker.translatesAutoresizingMaskIntoConstraints = false
//        speaker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:-200).isActive = true
//        speaker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-20).isActive = true
//        speaker.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        speaker.heightAnchor.constraint(equalToConstant: 70).isActive = true
//        
//        call.translatesAutoresizingMaskIntoConstraints = false
//        call.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        call.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant:-100).isActive = true
//        call.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        call.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
