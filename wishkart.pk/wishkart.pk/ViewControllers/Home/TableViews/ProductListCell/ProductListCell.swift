//
//  ProductListCell.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    // MARK: - identifier
    static let identifier = "ProductListCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    
    @IBOutlet weak var ratingViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
