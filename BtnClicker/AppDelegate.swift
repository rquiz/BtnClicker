//
//  AppDelegate.swift
//  BtnClicker
//
//  Created by ryan on 2/7/15.
//  Copyright (c) 2015 ryan. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var theLabel: NSTextField!
    @IBOutlet weak var theButton: NSButton!
    
    var buttonPresses = 0;
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    
    override func awakeFromNib() {
        theLabel.stringValue = "Button pressed \n \(buttonPresses) times!"
        
        //Add statusBarItem
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "Presses"
        
        //Add menuItem to menu
        menuItem.title = "Clicked \(buttonPresses)"
        menuItem.action = Selector("setWindowVisible:")
        menuItem.keyEquivalent = ""
        menu.addItem(menuItem)
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        self.window!.orderOut(self)
    }
    
    @IBAction func buttonPressed(sender: NSButton) {
        buttonPresses+=1
        theLabel.stringValue = "You've pressed the button \n \(buttonPresses) times!"
        menuItem.title = "Clicked \(buttonPresses)"
        statusBarItem.title = "Presses \(buttonPresses)"
    }
    
    func setWindowVisible(sender: AnyObject){
        self.window!.orderFront(self)
    }
    
    @IBAction func resetPressed(sender: NSButton) {
        buttonPresses=0
        theLabel.stringValue = "Reset! \n \(buttonPresses) button presses"
        menuItem.title = "Clicked \(buttonPresses)"
        statusBarItem.title = "Presses \(buttonPresses)"
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        self.window!.orderOut(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

