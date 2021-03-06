//
//  FirmaTableViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit
import StoreKit

class CompaniesTableViewController: UITableViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchFooter: SearchFooter!
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var companies = [CompanyDetailRearranged]()
    var filteredCompanies = [CompanyDetailRearranged]()
    let searchController = UISearchController(searchResultsController: nil)
    var counterForReview = 0
    var hasAskedForReview = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        tableView.tableFooterView = searchFooter
        
        setUpSearchController()
        createCompanyListArray()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !hasAskedForReview && counterForReview >= 5 {
            hasAskedForReview = true
            SKStoreReviewController.requestReview()
        }
    }
    
    private func createCompanyListArray() {
        let fileName = "CompanyDetails"
        var intermediate = [CompanyDetail]()
        intermediate = JSONDeserializer().toArray(fromFile: fileName)
        companies = intermediate.map { CompanyDetailRearranged(from: $0) }
        
        filterForBranch()
    }

    // MARK: TableView

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching() {
            searchFooter.setIsFilteringToShow(filteredItemCount: filteredCompanies.count, of: companies.count)
            return filteredCompanies.count
        }
        
        searchFooter.setNotFiltering(companies.count)
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CompanyTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CompanyTableViewCell else {
            fatalError("dequed cell is not an instance of CompanyTableViewCell.class")
        }
        
        let company: CompanyDetailRearranged
        
        if isSearching() {
            company = filteredCompanies[indexPath.row]
        } else {
            company = companies[indexPath.row]
        }
        
        cell.nameLabel.text = company.name
        cell.logoImageView.image = UIImage(named: "\(company.id)")
        
        cell.premiumTag.isHidden = true
        if company.id == 274 || company.id == 296 { // show tag for premium partners
            cell.premiumTag.isHidden = false
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .normal, title: "Teilen …") { action, index in
            var shareContent = "Diese Firma habe ich gerade auf der Pyramid gefunden:\n"
            
            if self.isSearching() {
                shareContent += self.filteredCompanies[index.row].name + "\n"
                shareContent += self.filteredCompanies[index.row].homepage + "\n"
            }
            else {
                shareContent += self.companies[index.row].name + "\n"
                shareContent += self.companies[index.row].homepage + "\n"
            }
            
            shareContent += "\nDu hast die Pyramid-App noch nicht?\n"
            shareContent += "Jetzt für iOS oder Android herunterladen:\n"
            shareContent += "iOS: https://itunes.apple.com/app/id1442865279?mt=8"
            shareContent += "\nAndroid: https://play.google.com/store/apps/details?id=pyramid.hsa.de.pentachoron"
            
            let activityViewController = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
            
            // make sure this works on iPad too
            if let activityViewController = activityViewController.popoverPresentationController {
                activityViewController.sourceView = tableView
                activityViewController.sourceRect = tableView.cellForRow(at: index)!.frame
            }
            
            self.present(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = .pyramidBlue
        
        return [share]
    }
    
    // MARK: Branch/Training Filter
    
    func filterForBranch() {
        let defaults = UserDefaultsController.shared
        var filterIsActive = false
        
        if defaults.architectureIsOn {
            companies.removeAll(where: { $0.interestDict[.architecture] == 0 } )
            filterIsActive = true
        }
        if defaults.electricalEngineeringIsOn {
            companies.removeAll(where: { $0.interestDict[.electricalEngineering] == 0 } )
            filterIsActive = true
        }
        if defaults.designIsOn {
            companies.removeAll(where: { $0.interestDict[.design] == 0 } )
            filterIsActive = true
        }
        if defaults.computerScienceIsOn {
            companies.removeAll(where: { $0.interestDict[.computerScience] == 0 } )
            filterIsActive = true
        }
        if defaults.mechanicalEngineeringIsOn {
            companies.removeAll(where: { $0.interestDict[.mechanicalEngineering] == 0 } )
            filterIsActive = true
        }
        if defaults.businessAdministrationIsOn {
            companies.removeAll(where: { $0.interestDict[.businessAdministration] == 0 } )
            filterIsActive = true
        }
        
        if defaults.internshipIsOn {
            companies.removeAll(where: { $0.internship == 0 } )
            filterIsActive = true
        }
        
        if defaults.internshipBenefitIsOn {
            companies.removeAll(where: { $0.internshipBenefit == 0 } )
            filterIsActive = true
        }
        
        if defaults.thesisIsOn {
            companies.removeAll(where: { $0.thesis == 0 } )
            filterIsActive = true
        }
        
        if defaults.thesisBenefitIsOn {
            companies.removeAll(where: { $0.thesisBenefit == 0 } )
            filterIsActive = true
        }
        
        if defaults.workingStudentIsOn {
            companies.removeAll(where: { $0.workingStudent == 0 } )
            filterIsActive = true
        }
        
        if defaults.workingStudentBenefitIsOn {
            companies.removeAll(where: { $0.workingStudentBenefit == 0 } )
            filterIsActive = true
        }
        
        if filterIsActive {
            filterButton.title = "Filter aktiv"
        } else {
            filterButton.title = "Filter"
        }
    }
    
    // MARK: Search
    
    private func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Nach Firma suchen …"
//        searchController.searchBar.scopeButtonTitles = ["Name", "Location", "PLZ"]
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isSearching() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    private func filterForSearchText(_ searchText: String) {
        filteredCompanies = companies.filter( { (company: CompanyDetailRearranged) -> Bool in
            return company.name.lowercased().contains(searchText.lowercased())
        } )
        tableView.reloadData()
    }
    
    // MARK: Segues
    
    @IBAction func filterViewUnwindAction(unwindSegue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "companyDetailSegue" {
            counterForReview += 1
            
            let cell = sender as! UITableViewCell
            let myIndex = tableView.indexPath(for: cell)!
            let companyDetailVC = (segue.destination as! UINavigationController).topViewController as! CompanyDetailViewController  // we need this since a navVC is in between
            
            if isSearching() {
                companyDetailVC.title = filteredCompanies[myIndex.row].name
                companyDetailVC.companyDetail = filteredCompanies[myIndex.row]
            } else {
                companyDetailVC.title = companies[myIndex.row].name
                companyDetailVC.companyDetail = companies[myIndex.row]
            }
        } else if segue.identifier == "filterSegue" {
            let filterVC = (segue.destination as! UINavigationController).topViewController as! FilterTableViewController
            filterVC.updateHandler = {
                self.createCompanyListArray()
                self.tableView.reloadData()
            }
        }
    }
    
}

extension CompaniesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterForSearchText(searchController.searchBar.text!)
    }
}
