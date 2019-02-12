//
//  UserDefaultsController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 20.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import Foundation

class UserDefaultsController {
    static let shared = UserDefaultsController(userDefaults: .standard)
    private var userDefaults: UserDefaults
    private let aKey = "Search For Architecture"
    private let eeKey = "Search For Electrical Engineering"
    private let dKey = "Search For Design"
    private let csKey = "Search For Computer Science"
    private let meKey = "Search For Mechanical Engineering"
    private let baKey = "Search For Business Administration"

    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    var architectureIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: aKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: aKey)
        }
    }
    
    var electricalEngineeringIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: eeKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: eeKey)
        }
    }
    
    var designIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: dKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: dKey)
        }
    }
    
    var computerScienceIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: csKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: csKey)
        }
    }
    
    var mechanicalEngineeringIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: meKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: meKey)
        }
    }
    
    var businessAdministrationIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: baKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: baKey)
        }
    }
}
