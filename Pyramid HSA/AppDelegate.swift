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
        window?.tintColor = .pyramidBlue
//        print(Array(UserDefaults.standard.dictionaryRepresentation()))
        return true
    }

    // MARK: QuickActions
    
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
        case .map:
            tabBarController.selectedIndex = 3
        }
        
        return true
    }
    
    enum QuickAction: String {
        case companies = "com.pekez.penta.show.companies"
        case events = "com.pekez.penta.show.events"
        case map = "com.pekez.penta.show.map"
        
        init?(identifier: String) {
            self.init(rawValue: identifier)
        }
    }
}
