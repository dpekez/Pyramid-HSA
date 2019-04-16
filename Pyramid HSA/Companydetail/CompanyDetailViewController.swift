//
//  CompanyDetailViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 09.12.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    @IBOutlet weak var interestsGraph: Graph!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var trainingTextView: UITextView!
    @IBOutlet weak var contactTextView: UITextView!
    @IBOutlet weak var footer: UIVisualEffectView!
    @IBOutlet weak var roomButton: UIButton!
    
    var companyDetail: CompanyDetailRearranged!
    var detailViewParagraphs: DetailViewParagraphs!
    var spiderGraphChoosen = true
    var currentGraph = Graph()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        self.navigationItem.leftItemsSupplementBackButton = true
        let lol = self.navigationItem.rightBarButtonItem
        self.navigationItem.rightBarButtonItem = nil
        
        if companyDetail != nil {
            detailViewParagraphs = DetailViewParagraphs()
            detailViewParagraphs.companyDetail = companyDetail
            createGraph()
            setOutlets()
            self.navigationItem.rightBarButtonItem = lol
        }
    }
    
    private func setOutlets() {
        footer.isHidden = false
        topImage.image = UIImage(named: "\(companyDetail.id)")
        detailsTextView.attributedText = detailViewParagraphs.buildDetailParagraph()
        trainingTextView.attributedText = detailViewParagraphs.buildTrainingParagraph()
        contactTextView.attributedText = detailViewParagraphs.buildContactParagraph()
        
        roomButton.setTitle(
            "Raum: " + companyDetail.room +
            "\nStand-Nr.: " + companyDetail.standNumber, for: .normal
        )
    }
    
    private func createGraph() {
        if spiderGraphChoosen {
            currentGraph = SpiderGraph(frame: CGRect(x: 0, y: 0, width: 320, height: 270))
        } else {
            currentGraph = CircularGraph(frame: CGRect(x: 0, y: 0, width: 320, height: 270))
        }
        
        currentGraph.setInterestRatings(interest: companyDetail!.interestDict)
        currentGraph.create()
        interestsGraph.addSubview(currentGraph)
    }
    
    @IBAction func roomButton(_ sender: UIButton) {
    }
    
    @IBAction func wwwButton(_ sender: UIBarButtonItem) {
        let actionSheet = UIAlertController(title: "Firmenwebseite", message: companyDetail.homepage, preferredStyle: .actionSheet)
        
        // make sure this works on iPad too
        if let actionSheet = actionSheet.popoverPresentationController {
            actionSheet.barButtonItem = sender
        }
        
        let link = URL(string: "http://\(companyDetail.homepage)")
        if link != nil {
            let openAction = UIAlertAction(title: "Öffnen", style: .default, handler: {_ in
                UIApplication.shared.open(link!, options: [:])})
            
            actionSheet.addAction(openAction)
        }
        
        let copyAction = UIAlertAction(title: "Kopieren", style: .default, handler: {_ in
            UIPasteboard.general.string = self.companyDetail.homepage})
        actionSheet.addAction(copyAction)
        actionSheet.addAction(UIAlertAction(title: "Abbrechen", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
    @IBAction func graphTap(_ sender: UITapGestureRecognizer) {
        if spiderGraphChoosen {
            spiderGraphChoosen = false
        } else {
            spiderGraphChoosen = true
        }
        currentGraph.removeFromSuperview()
        createGraph()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "floorSegue" {
            let floorsVC = segue.destination as! FloorsViewController
            floorsVC.room = companyDetail.room
            floorsVC.stand = companyDetail.standNumber
        }
    }
    
    /*
     // MARK: - Action methods
     
     @IBAction func toggleStar() {
     guard let colorItem = colorItem
     else { preconditionFailure("Expected a color item") }
     
     colorItem.starred.toggle()
     
     starButton.title = starButtonTitle()
     }
     
     @IBAction func delete() {
     guard let colorData = colorData
     else { preconditionFailure("Expected a reference to the color data container") }
     
     guard let colorItem = colorItem
     else { preconditionFailure("Expected a color item") }
     
     colorData.delete(colorItem)
     
     // The color no longer exists so dismiss this view controller.
     navigationController?.popViewController(animated: true)
     }
     
     // MARK: - Supporting Peek Quick Actions
     
     /// - Tag: PreviewActionItems
     override var previewActionItems: [UIPreviewActionItem] {
     let starAction = UIPreviewAction(title: starButtonTitle(), style: .default, handler: { [unowned self] (_, _) in
     guard let colorItem = self.colorItem
     else { preconditionFailure("Expected a color item") }
     
     colorItem.starred.toggle()
     })
     
     let deleteAction = UIPreviewAction(title: "Delete", style: .destructive) { [unowned self] (_, _) in
     guard let colorData = self.colorData
     else { preconditionFailure("Expected a reference to the color data container") }
     
     guard let colorItem = self.colorItem
     else { preconditionFailure("Expected a color item") }
     
     colorData.delete(colorItem)
     }
     
     return [ starAction, deleteAction ]
     }
 */
    
}
