//
//  EventCollectionViewCell.swift
//  Pyramid HSA
//
//  Created by Dejan Pekez on 12.02.19.
//  Copyright © 2019 Dejan Pekez. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureCell()
    }
    
    private func configureCell() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
}
