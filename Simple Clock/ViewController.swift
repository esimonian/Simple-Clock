//
//  ViewController.swift
//  Simple Clock
//
//  Created by Elizabeth Simonian on 2/5/16.
//  Copyright © 2016 Elizabeth Simonian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTimeLabel.text = ""
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateClock"), userInfo: nil, repeats: true)
        
    }
    
    func updateClock() {
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Second], fromDate: date)
        
        var hour = components.hour > 12 ? components.hour - 12 : components.hour
        hour = hour == 0 ? 12 : hour
        
        let hourString = hour > 9 ? "\(hour)" : "0\(hour)"
        
        let minutes = components.minute > 9 ? "\(components.minute)" : "0\(components.minute)"
        
        let seconds = components.second > 9 ? "\(components.second)" : "0\(components.second)"
        
        let am = components.hour > 12 ? "PM" : "AM"
        
        myTimeLabel.text = "\(hourString):\(minutes):\(seconds) \(am)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

