//
//  UIImageView+Extension.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func updateBorder() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
        
        self.layer.borderColor = appBorderColor.cgColor
        self.layer.borderWidth = 1
    }
}
