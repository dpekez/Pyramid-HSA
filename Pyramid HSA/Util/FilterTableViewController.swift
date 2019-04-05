//
//  FilterTableViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 20.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {
    
    @IBOutlet weak var architectureSwitch: UISwitch!
    @IBOutlet weak var electricalEngineeringSwitch: UISwitch!
    @IBOutlet weak var designSwitch: UISwitch!
    @IBOutlet weak var computerScienceSwitch: UISwitch!
    @IBOutlet weak var mechanicalEngineeringSwitch: UISwitch!
    @IBOutlet weak var businessAdministrationSwitch: UISwitch!
    @IBOutlet weak var internshipSwitch: UISwitch!
    @IBOutlet weak var internshipBenefitSwitch: UISwitch!
    @IBOutlet weak var thesisSwitch: UISwitch!
    @IBOutlet weak var thesisBenefitSwitch: UISwitch!
    @IBOutlet weak var workingStudentSwitch: UISwitch!
    @IBOutlet weak var workingStudentBenefitSwitch: UISwitch!
    
    private let userDefaults = UserDefaultsController.shared
    var updateHandler: (() -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        architectureSwitch.isOn = userDefaults.architectureIsOn
        electricalEngineeringSwitch.isOn = userDefaults.electricalEngineeringIsOn
        designSwitch.isOn = userDefaults.designIsOn
        computerScienceSwitch.isOn = userDefaults.computerScienceIsOn
        mechanicalEngineeringSwitch.isOn = userDefaults.mechanicalEngineeringIsOn
        businessAdministrationSwitch.isOn = userDefaults.businessAdministrationIsOn
        internshipSwitch.isOn = userDefaults.internshipIsOn
        internshipBenefitSwitch.isOn = userDefaults.internshipBenefitIsOn
        thesisSwitch.isOn = userDefaults.thesisIsOn
        thesisBenefitSwitch.isOn = userDefaults.thesisBenefitIsOn
        workingStudentSwitch.isOn = userDefaults.workingStudentIsOn
        workingStudentBenefitSwitch.isOn = userDefaults.workingStudentBenefitIsOn
        
        benefitButtonsStateSetup()
    }
    
    private func benefitButtonsStateSetup() {
        internshipBenefitButtonStateSetter()
        thesisBenefitButtonStateSetter()
        workingStudentBenefitButtonStateSetter()
    }
    
    private func internshipBenefitButtonStateSetter() {
        if internshipSwitch.isOn {
            internshipBenefitSwitch.isEnabled = true
        } else {
            internshipBenefitSwitch.isEnabled = false
            internshipBenefitSwitch.isOn = false
            userDefaults.internshipBenefitIsOn = false
        }
    }
    
    private func thesisBenefitButtonStateSetter() {
        if thesisSwitch.isOn {
            thesisBenefitSwitch.isEnabled = true
        } else {
            thesisBenefitSwitch.isEnabled = false
            thesisBenefitSwitch.isOn = false
            userDefaults.thesisBenefitIsOn = false
        }
    }
    
    private func workingStudentBenefitButtonStateSetter() {
        if workingStudentSwitch.isOn {
            workingStudentBenefitSwitch.isEnabled = true
        } else {
            workingStudentBenefitSwitch.isEnabled = false
            workingStudentBenefitSwitch.isOn = false
            userDefaults.workingStudentBenefitIsOn = false
        }
    }
    
    @IBAction func architectureChanged(_ sender: UISwitch) {
        userDefaults.architectureIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func electricalEngineeringChanged(_ sender: UISwitch) {
        userDefaults.electricalEngineeringIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func designChanged(_ sender: UISwitch) {
        userDefaults.designIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func computerScienceChanged(_ sender: UISwitch) {
        userDefaults.computerScienceIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func mechanicalEngineeringChanged(_ sender: UISwitch) {
        userDefaults.mechanicalEngineeringIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func businessAdministrationChanged(_ sender: UISwitch) {
        userDefaults.businessAdministrationIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func internshipChanged(_ sender: UISwitch) {
        userDefaults.internshipIsOn = sender.isOn
        internshipBenefitButtonStateSetter()
        updateHandler()
    }
    
    @IBAction func internshipBenefitChanged(_ sender: UISwitch) {
        userDefaults.internshipBenefitIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func thesisChanged(_ sender: UISwitch) {
        userDefaults.thesisIsOn = sender.isOn
        thesisBenefitButtonStateSetter()
        updateHandler()
    }
    
    @IBAction func thesisBenefitChanged(_ sender: UISwitch) {
        userDefaults.thesisBenefitIsOn = sender.isOn
        updateHandler()
    }
    
    @IBAction func workingStudentChanged(_ sender: UISwitch) {
        userDefaults.workingStudentIsOn = sender.isOn
        workingStudentBenefitButtonStateSetter()
        updateHandler()
    }
    
    @IBAction func workingStudentBenefitChanged(_ sender: UISwitch) {
        userDefaults.workingStudentBenefitIsOn = sender.isOn
        updateHandler()
    }
    
}
