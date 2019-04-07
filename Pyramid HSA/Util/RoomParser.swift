//
//  RoomParser.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 07.04.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import Foundation

class RoomParser {
    
    func getFloor(string: String) -> Floor {
        let string = string.lowercased()
        
        if string.contains("zelt") {
            if string.contains("a") {
                return .tentA
            } else {
                return .tentB
            }
        } else if string.contains("m") {
            if string.contains("eg") || string.contains("mensa") || string.contains("k"){
                return .mMain
            } else {
                return .mSecond
            }
        } else if string.contains("w") {
            if string.contains("w1") || string.contains("eg") || string.contains("foyer") {
                return .wMain
            } else {
                return .wSecond
            }
        } else {
            return .lMain
        }
        
    }
    
}
