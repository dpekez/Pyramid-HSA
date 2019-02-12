//
//  FirmaTableViewController.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 06.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class CompaniesTableViewController: UITableViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchFooter: SearchFooter!

    var companies = [CompanyDetailRearranged]()
    var filteredCompanies = [CompanyDetailRearranged]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        tableView.tableFooterView = searchFooter
        
        setUpSearchController()
        createCompanyListArray()
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

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            var shareContent = "Look at this Company I've just found in the Pyramid App:\n"
            
            if self.isSearching() {
                shareContent += self.filteredCompanies[index.row].name + "\n"
                shareContent += self.filteredCompanies[index.row].homepage
            }
            else {
                shareContent += self.companies[index.row].name + "\n"
                shareContent += self.companies[index.row].homepage
            }
            
            let activityViewController = UIActivityViewController(activityItems: [shareContent], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = PyramidColor.pyramidBlue
        
        return [share]
    }
    
    // MARK: Branch Filter
    
    func filterForBranch() {
        let defaults = UserDefaultsController.shared
        
        if defaults.architectureIsOn {
            companies.removeAll(where: { $0.interestDict[.architecture] == 0 } )
        }
        if defaults.electricalEngineeringIsOn {
            companies.removeAll(where: { $0.interestDict[.electricalEngineering] == 0 } )
        }
        if defaults.designIsOn {
            companies.removeAll(where: { $0.interestDict[.design] == 0 } )
        }
        if defaults.computerScienceIsOn {
            companies.removeAll(where: { $0.interestDict[.computerScience] == 0 } )
        }
        if defaults.mechanicalEngineeringIsOn {
            companies.removeAll(where: { $0.interestDict[.mechanicalEngineering] == 0 } )
        }
        if defaults.businessAdministrationIsOn {
            companies.removeAll(where: { $0.interestDict[.businessAdministration] == 0 } )
        }
    }
    
    // MARK: Search
    
    private func setUpSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for company…"
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
        createCompanyListArray()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "companyDetailSegue" {
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
        }
    }
}

extension CompaniesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterForSearchText(searchController.searchBar.text!)
    }
}
