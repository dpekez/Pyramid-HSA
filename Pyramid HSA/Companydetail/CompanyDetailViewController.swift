//
//  CompanyDetailViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 09.12.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class CompanyDetailViewController: UIViewController {
    @IBOutlet weak var interestsGraph: CircularBars!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var trainingTextView: UITextView!
    @IBOutlet weak var contactTextView: UITextView!
    
    var companyDetail: CompanyDetailRearranged!
    var detailViewParagraphs: DetailViewParagraphs!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
        self.navigationItem.leftItemsSupplementBackButton = true
        
        if companyDetail != nil {
            detailViewParagraphs = DetailViewParagraphs()
            detailViewParagraphs.companyDetail = companyDetail
            createGraph()
            setOutlets()
        }
    }
    
    private func setOutlets() {
        topImage.image = UIImage(named: "\(companyDetail.id)")
        detailsTextView.attributedText = detailViewParagraphs.buildDetailParagraph()
        trainingTextView.attributedText = detailViewParagraphs.buildTrainingParagraph()
        contactTextView.attributedText = detailViewParagraphs.buildContactParagraph()
    }
    
    private func createGraph() {
        interestsGraph.setInterestRatings(interest: companyDetail!.interestDict)
        interestsGraph.createCircularBars()
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
