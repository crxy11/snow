//
//  SnowFlake.swift
//  snow
//
//  Created by Jan Lagarden on 09.12.15.
//  Copyright © 2015 Jan Lagarden. All rights reserved.
//

import Foundation
import AppKit

class SnowFlake : CALayer {
    var rotationSpeed : Int
    var size : Int
    
    override init() {
        self.size = 10 + (random() % 11)
        self.rotationSpeed = 3 + (random() % 3)
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = CFTimeInterval(self.rotationSpeed)
        animation.repeatCount = Float(IntMax.max)
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        
        let screenWidth = ((NSScreen.mainScreen()?.frame.size.width)!-CGFloat(self.size))
        let screenHeight = ((NSScreen.mainScreen()?.frame.size.height)!-CGFloat(self.size))
        super.init()
        self.opaque = true
        self.backgroundColor = NSColor.clearColor().CGColor
        self.borderWidth = 0
        self.contents = NSImage(named: "SF")
        self.frame = CGRectMake(CGFloat(random() % Int(screenWidth)), CGFloat(random() % Int(screenHeight)) , CGFloat(self.size), CGFloat(self.size))
        self.shadowRadius = 0
        self.addAnimation(animation, forKey: "rotation")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.size = 10 + (random() % 11)
        self.rotationSpeed = 2 + (random() % 3)
        
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = CFTimeInterval(self.rotationSpeed)
        animation.repeatCount = Float(IntMax.max)
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        
        let screenWidth = ((NSScreen.mainScreen()?.frame.size.width)!-CGFloat(self.size))
        let screenHeight = ((NSScreen.mainScreen()?.frame.size.height)!-CGFloat(self.size))
        super.init(coder: aDecoder)
        self.opaque = true
        self.contents = NSImage(named: "SF")
        self.borderWidth = 0
        self.backgroundColor = NSColor.clearColor().CGColor
        self.frame = CGRectMake(CGFloat(random() % Int(screenWidth)), CGFloat(random() % Int(screenHeight)) , CGFloat(self.size), CGFloat(self.size))
        self.shadowRadius = 0
        self.addAnimation(animation, forKey: "rotation")
    }
    
}
