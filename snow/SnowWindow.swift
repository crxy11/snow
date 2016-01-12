//
//  SnowWindow.swift
//  snowflakes
//
//  Created by Jan Lagarden on 06.12.15.
//  Copyright © 2015 Jan Lagarden. All rights reserved.
//

import AppKit

class SnowWindow : NSPanel {
    
    override var canBecomeKeyWindow : Bool {
        get {
                return true
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, `defer` flag: Bool) {
        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, `defer`: false)
        self.styleMask =  NSBorderlessWindowMask
        //self.styleMask = NSHUDWindowMask
        self.opaque = true
        self.backingType = NSBackingStoreType.Buffered
        self.backgroundColor = NSColor.clearColor()
        self.floatingPanel = true
        self.level = Int(CGShieldingWindowLevel())
        self.collectionBehavior = [NSWindowCollectionBehavior.CanJoinAllSpaces,
                                    NSWindowCollectionBehavior.IgnoresCycle,
                                    NSWindowCollectionBehavior.Stationary,
                                    NSWindowCollectionBehavior.FullScreenDisallowsTiling,
                                    NSWindowCollectionBehavior.FullScreenAuxiliary]
        self.canBecomeVisibleWithoutLogin = true
        self.makeKeyAndOrderFront(NSApp)
    }
    
    override func constrainFrameRect(frameRect: NSRect, toScreen screen: NSScreen?) -> NSRect {
        return super.constrainFrameRect(frameRect, toScreen: self.screen)
    }
}