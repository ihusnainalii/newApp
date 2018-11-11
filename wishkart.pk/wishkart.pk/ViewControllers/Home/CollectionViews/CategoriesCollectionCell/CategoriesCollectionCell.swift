//
//  CategoriesCollectionCell.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {

    // MARK: - identifier
    static let identifier = "CategoriesCollectionCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var cateImage: UIImageView!
    @IBOutlet weak var cateLabel: UILabel!
    
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cateImage.layer.cornerRadius = cateImage.bounds.width / 2
        cateImage.layer.masksToBounds = true
        cateImage.layer.borderColor = appBorderColor.cgColor
        cateImage.layer.borderWidth = 1
    }

}
