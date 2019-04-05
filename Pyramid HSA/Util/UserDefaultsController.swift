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
    private let architectureKey = "architecture"
    private let electricalEngineeringKey = "electricalEngineering"
    private let designKey = "design"
    private let computerScienceKey = "computerScience"
    private let mechanicalEngineeringKey = "mechanicalEngineering"
    private let businessAdministrationKey = "businessAdministration"
    private let internshipKey = "internship"
    private let internshipBenefitKey = "internshipBenefit"
    private let thesisKey = "thesis"
    private let thesisBenefitKey = "thesisBenefit"
    private let workingStudentKey = "workingStudent"
    private let workingStudentBenefitKey = "workingStudentBenefit"

    private init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    // MARK: Faculties
    
    var architectureIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: architectureKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: architectureKey)
        }
    }
    
    var electricalEngineeringIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: electricalEngineeringKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: electricalEngineeringKey)
        }
    }
    
    var designIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: designKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: designKey)
        }
    }
    
    var computerScienceIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: computerScienceKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: computerScienceKey)
        }
    }
    
    var mechanicalEngineeringIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: mechanicalEngineeringKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: mechanicalEngineeringKey)
        }
    }
    
    var businessAdministrationIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: businessAdministrationKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: businessAdministrationKey)
        }
    }
    
    // MARK: Trainings
    
    var internshipIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: internshipKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: internshipKey)
        }
    }
    
    var internshipBenefitIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: internshipBenefitKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: internshipBenefitKey)
        }
    }
    
    var thesisIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: thesisKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: thesisKey)
        }
    }
    
    var thesisBenefitIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: thesisBenefitKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: thesisBenefitKey)
        }
    }
    
    var workingStudentIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: workingStudentKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: workingStudentKey)
        }
    }
    
    var workingStudentBenefitIsOn: Bool {
        get {
            guard let rawValue = userDefaults.object(forKey: workingStudentBenefitKey) as? Bool else {
                return false
            }
            return rawValue
        }
        set {
            userDefaults.set(newValue, forKey: workingStudentBenefitKey)
        }
    }
    
}
