//
//  ViewController.swift
//  Countdown
//
//  Created by Ramon Zamorano on 29/04/20.
//  Copyright © 2020 Ramon Zamorano. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {

    var OurTimer = Timer()
    var TimerDisplayed = 0
    
    @IBOutlet weak var Label: NSTextField!
    
    
    @IBAction func StartBTN(_ sender: Any) {
        OurTimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    @IBAction func PauseBTN(_ sender: Any) {
        OurTimer.invalidate()
    }
    
    
    
    @IBAction func ResetBTN(_ sender: Any) {
        OurTimer.invalidate()
        TimerDisplayed=0
        Label.stringValue = "0"
    }
    
    @objc func Action(){
        TimerDisplayed += 1
        Label.stringValue = String(TimerDisplayed)
    }
    
    
    
    override func viewDidLoad() {
        //super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   //override var representedObject: Any? {
   //     didSet {
        // Update the view, if already loaded.
    //    }
   // }


}

