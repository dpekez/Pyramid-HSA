//
//  InformationTableViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 24.03.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit
import MessageUI

class AboutTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    private func mailComposer() {
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            let systemVersion = UIDevice.current.systemVersion
            let hardware = UIDevice.current.model
            let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
            let buildVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? ""
            let recipient = "dejan.pekez@hs-augsburg.de"
            let subject = "Pyramid HSA \(appVersion)"
            
            let messageBody = """
            
            
            ---------------
            Gerät: \(hardware)
            iOS-Version: \(systemVersion)
            App-Version: \(appVersion) (\(buildVersion))
            
            """
            
            composeVC.setToRecipients([recipient])
            composeVC.setSubject(subject)
            composeVC.setMessageBody(messageBody, isHTML: false)
            
            self.present(composeVC, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()
        }
    }
    
    func showSendMailErrorAlert(_ error: NSError? = nil) {
        let errorMsg: String
        
        if let e = error?.localizedDescription {
            errorMsg = e
        } else {
            errorMsg = #"Vermutlich ist „Mail“ nicht konfiguriert. Bitte überprüfe deine Einstellungen und versuche es erneut."#
        }
        
        let alert = UIAlertController(title: "E-Mail kann nicht gesendet werden", message: errorMsg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Schließen", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
        if result == .sent {
            let alert = UIAlertController(title: "Danke für dein Feedback!", message: "🤠", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Schließen", style: .cancel))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        openURL(string: "https://www.pyramid-hsa.de/team.php")
    }
    
    @IBAction func facebookButton(_ sender: UIButton) {
        openURL(string: "https://www.facebook.com/Firmenkontaktmesse.Pyramid/")
    }
    
    @IBAction func instagramButton(_ sender: UIButton) {
        openURL(string: "https://www.instagram.com/pyramid_hsa/")
    }
    
    @IBAction func storeRatingButton(_ sender: UIButton) {
        openURL(string: "https://itunes.apple.com/app/id1442865279?action=write-review")
    }
    
    @IBAction func feedbackButton(_ sender: UIButton) {
        mailComposer()
    }
}

extension AboutTableViewController {
    private func openURL(string: String) {
        UIApplication.shared.open(URL(string: string)!, options: [:])
    }
}
