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
        
        cell.backgroundColor = UIColor.white
        if company.id == 274 || company.id == 296 {
            cell.backgroundColor = PyramidColor.pyramidBrighterBlue
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
            shareContent += "iOS: https://itunes.apple.com/app/id1442865279"
            shareContent += "\nAndroid: ;)"
            
            let activityViewController = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = PyramidColor.pyramidBlue
        
        return [share]
    }
    
    // MARK: Branch Filter
    
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
        
        if filterIsActive {
            filterButton.title = "•Filter"
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
            let companyDetailVC = (segue.destination as! UINavigationController).topViewController as! CompanyDetailViewController
            
            if isSearching() {
                companyDetailVC.title = filteredCompanies[myIndex.row].name
                companyDetailVC.companyDetail = filteredCompanies[myIndex.row]
            } else {
                companyDetailVC.title = companies[myIndex.row].name
                companyDetailVC.companyDetail = companies[myIndex.row]
            }
        } else if segue.identifier == "filterSegue" {
            let filterVC = segue.destination as! FilterTableViewController
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
