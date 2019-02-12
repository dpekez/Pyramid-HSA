//
//  SearchFooter.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 18.11.18.
//  Copyright © 2018 Dejan Pekez. All rights reserved.
//

import UIKit

class SearchFooter: UIView {
    let label = UILabel()
    
    override func awakeFromNib() {
        configureView()
    }
    
    override func draw(_ rect: CGRect) {
        label.frame = self.bounds
    }
    
    func configureView() {
        label.textAlignment = .center
        addSubview(label)
    }
    
    func setNotFiltering(_ totalItemCount: Int) {
        label.text = "\(totalItemCount) Companies"
    }
    
    func setIsFilteringToShow(filteredItemCount: Int, of totalItemCount: Int) {
        if (filteredItemCount == totalItemCount) {
            setNotFiltering(totalItemCount)
        } else if (filteredItemCount == 0) {
            label.text = "No Result"
        } else {
            label.text = "\(filteredItemCount) of \(totalItemCount) Companies"
        }
    }
}
