//
//  CompaniesSplitViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 25.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class CompaniesSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        preferredDisplayMode = .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
