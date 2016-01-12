//
//  ViewController.swift
//  snow
//
//  Created by Jan Lagarden on 08.12.15.
//  Copyright © 2015 Jan Lagarden. All rights reserved.
//

import Cocoa
import AppKit

class ViewController: NSViewController {
    
    var rootLayer : CALayer?
    var l1 : CALayer?
    var l2 : CALayer?
    var l3 : CALayer?
    var l4 : CALayer?
    
    required init?(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        rootLayer = mkLayer()
        l1 = mkLayer()
        l2 = mkLayer()
        l3 = mkLayer()
        l4 = mkLayer()
        
        self.view.layer = rootLayer
        self.view.wantsLayer  = true
        
        rootLayer?.addSublayer(l1!)
        rootLayer?.addSublayer(l2!)
        rootLayer?.addSublayer(l3!)
        rootLayer?.addSublayer(l4!)
        
        let fallAnimation : CABasicAnimation = CABasicAnimation(keyPath: "position.y")
        fallAnimation.duration = 40
        fallAnimation.repeatCount = Float(IntMax.max)
        fallAnimation.fromValue = NSScreen.mainScreen()?.frame.height
        fallAnimation.toValue = -1 * (NSScreen.mainScreen()?.frame.height)!
        fallAnimation.timeOffset = 0
        
        let fallAnimation2 : CABasicAnimation = CABasicAnimation(keyPath: "position.y")
        fallAnimation2.duration = 40
        fallAnimation2.repeatCount = Float(IntMax.max)
        fallAnimation2.fromValue = NSScreen.mainScreen()?.frame.height
        fallAnimation2.toValue = -1 * (NSScreen.mainScreen()?.frame.height)!
        fallAnimation2.timeOffset = 20
        
        let fallAnimation3 : CABasicAnimation = CABasicAnimation(keyPath: "position.y")
        fallAnimation3.duration = 20
        fallAnimation3.repeatCount = Float(IntMax.max)
        fallAnimation3.fromValue = NSScreen.mainScreen()?.frame.height
        fallAnimation3.toValue = -1 * (NSScreen.mainScreen()?.frame.height)!
        fallAnimation3.timeOffset = 0
        
        let fallAnimation4 : CABasicAnimation = CABasicAnimation(keyPath: "position.y")
        fallAnimation4.duration = 20
        fallAnimation4.repeatCount = Float(IntMax.max)
        fallAnimation4.fromValue = NSScreen.mainScreen()?.frame.height
        fallAnimation4.toValue = -1 * (NSScreen.mainScreen()?.frame.height)!
        fallAnimation4.timeOffset = 10
        
        l1?.addAnimation(fallAnimation, forKey: "position.y")
        l2?.addAnimation(fallAnimation2, forKey: "position.y")
        l3?.addAnimation(fallAnimation3, forKey: "position.y")
        l4?.addAnimation(fallAnimation4, forKey: "position.y")
    }
    
    override func viewWillAppear() {
        //super.viewWillAppear()
        
        
    }
    
    override func viewDidAppear() {
        //super.viewDidAppear()
        var myframe = NSRect();
        myframe.size.width = (NSScreen.mainScreen()?.frame.width)!;
        myframe.size.height = (NSScreen.mainScreen()?.frame.height)!;
        myframe.origin.y = (NSScreen.mainScreen()?.frame.origin.y)!;
        myframe.origin.x = (NSScreen.mainScreen()?.frame.origin.x)!;
        
        
        self.view.window?.setFrame(myframe, display: true)
        
        for _ in 1...100 {
            self.addSnowFlake(layerToAdd: self.l1!)
        }
        
        for _ in 1...100 {
            self.addSnowFlake(layerToAdd: self.l2!)
        }
        for _ in 1...100 {
            self.addSnowFlake(layerToAdd: self.l3!)
        }
        for _ in 1...100 {
            self.addSnowFlake(layerToAdd: self.l4!)
        }
        
        
        let presOptions: NSApplicationPresentationOptions = [
            NSApplicationPresentationOptions.HideDock                  ,
            NSApplicationPresentationOptions.AutoHideMenuBar           ,
            NSApplicationPresentationOptions.DisableAppleMenu          ,
            NSApplicationPresentationOptions.DisableProcessSwitching   ,
            NSApplicationPresentationOptions.DisableForceQuit          ,
            NSApplicationPresentationOptions.DisableSessionTermination ,
            NSApplicationPresentationOptions.DisableHideApplication    ,
            NSApplicationPresentationOptions.AutoHideToolbar           ,
            NSApplicationPresentationOptions.FullScreen
        ]
        NSApp.presentationOptions = presOptions
    }
    
    func mkLayer() -> CALayer {
        let layer : CALayer = CALayer()
        layer.opaque = false
        layer.backgroundColor = NSColor.clearColor().CGColor
        layer.shadowRadius = 0
        layer.shadowOpacity = 1
        layer.shadowColor = NSColor.clearColor().CGColor
        return layer
    }
    
    func addSnowFlake(layerToAdd layer: CALayer) {
        let sf : SnowFlake = SnowFlake()
        layer.addSublayer(sf)
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded
        }
    }
    
    
}
