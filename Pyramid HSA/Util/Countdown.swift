//
//  Countdown.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 17.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import Foundation

class Countdown {
    let eventYear = 2019
    let eventMonth = 5
    let eventDay = 29
    let eventStartingHour = 10
    let eventEndingHour = 15
    
    let currentDate: Date
    let startDate: Date
    let endDate: Date
    
    init() {
        let calendar = Calendar.current
        
        // make sure we define time only down to minutes or the displayed calculation will be off by 1 minute
        let currentDateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: Date())
        currentDate = calendar.date(from: currentDateComponents)!
        
        let startDateComponents = DateComponents(year: eventYear, month: eventMonth, day: eventDay, hour: eventStartingHour)
        startDate = calendar.date(from: startDateComponents)!
        
        let endDateComponents = DateComponents(year: eventYear, month: eventMonth, day: eventDay, hour: eventEndingHour)
        endDate = calendar.date(from: endDateComponents)!
    }
    
    func getTimeDiff() -> Int {
        let timeIntervalDiff = Date().timeIntervalSince(startDate)
        let timeDiff = floor(timeIntervalDiff) * -1
        return Int(timeDiff)
    }
    
    
    
}
