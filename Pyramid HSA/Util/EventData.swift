//
//  EventData.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import Foundation

struct EventData {
    private var eventDict: Dictionary<String, Dictionary<String, Any>>
    var eventArray: [Dictionary<String, Dictionary<String, Any>>]
    
    private let eventYear = 2019
    private let eventMonth = 5
    private let eventDay = 29
    
    let eventName = "Event 1"
    let eventDescription = "blablabla"
}
