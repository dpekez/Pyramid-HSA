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
    
    let startDate: Date
    let endDate: Date
    
    init() {
        let calendar = Calendar.current
        
        let startDateComponents = DateComponents(year: eventYear, month: eventMonth, day: eventDay, hour: eventStartingHour)
        startDate = calendar.date(from: startDateComponents)!
        
        let endDateComponents = DateComponents(year: eventYear, month: eventMonth, day: eventDay, hour: eventEndingHour)
        endDate = calendar.date(from: endDateComponents)!
    }
    
    func getDayDiff() -> Int {
        return Calendar.current.dateComponents([.day], from: Date(), to: startDate).day ?? 0
    }
    
    func getHourDiff() -> Int {
        return Calendar.current.dateComponents([.day, .hour], from: Date(), to: startDate).hour ?? 0
    }
    
    func getMinuteDiff() -> Int {
        return Calendar.current.dateComponents([.day, .hour, .minute], from: Date(), to: startDate).minute ?? 0
    }
    
    func getSecondDiff() -> Int {
        return Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: startDate).second ?? 0
    }
    
    func eventIsCommingUp() -> Bool {
        return !eventIsLive()
    }
    
    func eventIsLive() -> Bool {
        return Date() > startDate && !eventIsOver()
    }
    
    func eventIsOver() -> Bool {
        return Date() > endDate
    }
}
