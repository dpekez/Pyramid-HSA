//
//  TodayViewController.swift
//  Countdown Widget
//
//  Created by Dejan Pekez on 23.12.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var countDownLabel: UILabel!
    
    let eventYear = 2019
    let eventMonth = 5
    let eventDay = 29
    let eventStartingHour = 10
    let eventEndingHour = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateConfig()
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func dateConfig() {
        let calendar = Calendar.current
        
        // make sure we define time only down to minutes or the displayed calculation will be off by 1 minute
        let currentDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
        let currentDate = calendar.date(from: currentDateComponents)!
        
        let startDateComponents = DateComponents(year: eventYear, month: eventMonth, day: eventDay, hour: eventStartingHour)
        let startDate = calendar.date(from: startDateComponents)!
        
        let endDateComponents = DateComponents(year: eventYear, month: eventMonth, day: eventDay, hour: eventEndingHour)
        let endDate = calendar.date(from: endDateComponents)!
        
//        print("\nDate(): \(Date()) \ncurrentDateComponents: \(currentDateComponents) \ncurrentDate: \(currentDate)")
        
        if currentDate < startDate {
            let dateDifference = calendar.dateComponents([.day, .hour, .minute], from: currentDate, to: startDate)
            let daysLeft = dateDifference.day
            let hoursLeft = dateDifference.hour
            let minutesLeft = dateDifference.minute
            
            countDownLabel.text = "\(daysLeft ?? 0) Days, \(hoursLeft ?? 0) Hours, \(minutesLeft ?? 0) Minutes"
        } else if currentDate < endDate {
            countDownLabel.text = "Have fun at Pyramid 2019!"
        } else {
            countDownLabel.text = "See you next time!"
        }
    }
}

/*
 var timer = Timer()
 
 func updateInfo() {
    strTimer.text = Date().description
 }
 
 override func viewDidLoad() {
    super.viewDidLoad()
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateInfo), userInfo: nil, repeats: true)
    RunLoop.main.add(timer, forMode: .commonModes)
 }
 
 func widgetPerformUpdate(completionHandler: @escaping (NCUpdateResult) -> Void) {
    completionHandler(.newData)
 }
 */
