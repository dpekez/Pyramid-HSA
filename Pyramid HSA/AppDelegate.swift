//
//  AppDelegate.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.tintColor = PyramidColor.pyramidBlue
//        print(Array(UserDefaults.standard.dictionaryRepresentation()))
        return true
    }

    // MARK: QuickActions
    
    enum QuickAction: String {
        case companies = "com.pekez.penta.show.companies"
        case events = "com.pekez.penta.show.events"
        
        init?(identifier: String) {
            self.init(rawValue: identifier)
        }
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(handleQuickAction(shortcutItem: shortcutItem))
    }
    
    private func handleQuickAction(shortcutItem: UIApplicationShortcutItem) -> Bool {
        let shortcutType = shortcutItem.type
        
        guard let shortcutIdentifier = QuickAction(identifier: shortcutType) else {
            return false
        }
        
        guard let tabBarController = window?.rootViewController as? UITabBarController else {
            return false
        }
        
        switch shortcutIdentifier {
        case .companies:
            tabBarController.selectedIndex = 1
        case .events:
            tabBarController.selectedIndex = 2
        }
        
        return true
    }
}
