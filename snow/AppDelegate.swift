//
//  AppDelegate.swift
//  snow
//
//  Created by Jan Lagarden on 08.12.15.
//  Copyright © 2015 Jan Lagarden. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSScreen.screens()?.forEach({ screen in
            //if(screen !== NSScreen.mainScreen()) {
                let story = NSStoryboard(name: "Main" ,bundle: NSBundle.mainBundle())
                let windowc = story.instantiateInitialController()
                windowc!.showWindow(self)
                
                print("another screen attached")
           // }
        })
    }
    
    func applicationDidChangeScreenParameters(notification: NSNotification) {
        
    }
}

