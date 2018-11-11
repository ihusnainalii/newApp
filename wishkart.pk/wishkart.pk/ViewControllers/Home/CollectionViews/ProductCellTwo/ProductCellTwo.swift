//
//  ProductCellTwo.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class ProductCellTwo: UICollectionViewCell {

    
    // MARK: - identifier
    static let identifier = "ProductCellTwo"
    
    // MARK: - IBOutlets
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var actualPriceLabel: UILabel!
    
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "1,100")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        actualPriceLabel.attributedText = attributeString
    }

}
