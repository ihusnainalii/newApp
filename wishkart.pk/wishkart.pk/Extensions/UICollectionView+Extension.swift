//
//  UICollectionView+Extension.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func updateHorizontalCollectionViewFLow() {
        // Create flow layout
        let flow = UICollectionViewFlowLayout()
        
        flow.minimumInteritemSpacing = 5
        flow.minimumLineSpacing = 5
        flow.scrollDirection = .horizontal
        
        // Apply flow layout
        self.setCollectionViewLayout(flow, animated: false)
    }
    
    func updateZeroCollectionViewFLow() {
        // Create flow layout
        let flow = UICollectionViewFlowLayout()
        
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        flow.scrollDirection = .vertical
        
        // Apply flow layout
        self.setCollectionViewLayout(flow, animated: false)
    }
    
    func updateStyleOneCollectionViewFLow() {
        // Create flow layout
    
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 5
        flow.scrollDirection = .vertical
        
        // Apply flow layout
        self.setCollectionViewLayout(flow, animated: true)
    }
    
    func clearBackground() {
        self.backgroundColor = .clear
        self.backgroundView = UIView(frame: .zero)
    }
}
