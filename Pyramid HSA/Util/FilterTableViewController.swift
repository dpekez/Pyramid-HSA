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
}
