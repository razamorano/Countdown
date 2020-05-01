//
//  ViewController.swift
//  Countdown
//
//  Created by Ramon Zamorano on 29/04/20.
//  Copyright © 2020 Ramon Zamorano. All rights reserved.
//

import Cocoa
import Foundation
import AVFoundation //import audio library

class ViewController: NSViewController {

    var audioPlayer = AVAudioPlayer() // initializing the AVAudioPlayer object
    var CountdownTimer = Timer()
    var SecondsDisplayed = 0
    var MinutesDisplayed = 60
    
    @IBOutlet weak var SecondsLBL: NSTextField!
    @IBOutlet weak var MinutesLBL: NSTextField!
    
    
    @IBAction func StartBTN(_ sender: Any) {
        CountdownTimer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
    }
    
    @IBAction func PauseBTN(_ sender: Any) {
        CountdownTimer.invalidate()
    }

    
    @IBAction func ResetBTN(_ sender: Any) {
        CountdownTimer.invalidate()
        MinutesDisplayed = 60
        MinutesLBL.stringValue = String(MinutesDisplayed)
        SecondsDisplayed = 0
        SecondsLBL.stringValue = "0" + String(SecondsDisplayed)
        audioPlayer.play()
    }
    
    @objc func Action(){
        SecondsDisplayed -= 1
        if SecondsDisplayed < 0 {
            MinutesDisplayed -= 1
            SecondsDisplayed = 59
        }
        if MinutesDisplayed < 0 {
            CountdownTimer.invalidate()
            MinutesDisplayed = 0
            MinutesLBL.stringValue = "0" + String(MinutesDisplayed)
            SecondsDisplayed = 0
            SecondsLBL.stringValue = "0" + String(SecondsDisplayed)
            audioPlayer.play()
        }
        else {
            if MinutesDisplayed < 10 {
                MinutesLBL.stringValue = "0" + String(MinutesDisplayed)
            }
            else {
                MinutesLBL.stringValue = String(MinutesDisplayed)
            }
            if SecondsDisplayed < 10 {
                SecondsLBL.stringValue = "0" + String(SecondsDisplayed)
            }
            else {
                SecondsLBL.stringValue = String(SecondsDisplayed)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        let sound = Bundle.main.path(forResource: "alert", ofType: "wav")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        // Do any additional setup after loading the view.
    }

   //override var representedObject: Any? {
   //     didSet {
        // Update the view, if already loaded.
    //    }
   // }


}

