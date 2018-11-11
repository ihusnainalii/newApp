//
//  BrandListViewController.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class BrandListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var cartCountView: UIView!
    @IBOutlet weak var cartCountLabel: UILabel!
    @IBOutlet weak var brandTypeLabel: UILabel!
    @IBOutlet weak var brandCollection: UICollectionView!
    
    // MARK: - Variables
    var isFeatured = false
    
    ///MARK:- Chnage Sttaus bar to light color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if isFeatured {
            brandTypeLabel.text = "Featured Brands"
        }else{
            brandTypeLabel.text = "Top Brands"
        }
        
        // Views Settings
        cartCountView.layer.cornerRadius = cartCountView.bounds.height / 2
        cartCountView.setBorder(radius: cartCountView.bounds.height / 2, color: .white)
        
        // Collection view settings
        brandCollection.clearBackground()
        brandCollection.updateStyleOneCollectionViewFLow()
        brandCollection.delegate = self
        brandCollection.dataSource = self
    }

    // MARK: - IBActions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSearchTapped(_ sender: UIButton) {
        let storyboardRef = UIStoryboard(name: StoryboardReference.Search.rawValue, bundle: nil)
        let view = storyboardRef.instantiateViewController(withIdentifier: ViewControllerReference.SearchViewController.rawValue) as! SearchViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
    @IBAction func btnCartTapped(_ sender: UIButton) {
    }
}

extension BrandListViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Register Cell
        self.brandCollection.register(UINib(nibName: FeatureBrandCell.identifier, bundle: nil), forCellWithReuseIdentifier: FeatureBrandCell.identifier)
        
        // Cell
        let cell = brandCollection.dequeueReusableCell(withReuseIdentifier: FeatureBrandCell.identifier, for: indexPath as IndexPath) as! FeatureBrandCell
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.red.cgColor
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (brandCollection.bounds.width / 2) - 3
        let height = (brandCollection.bounds.height / 4) - 10
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let storyboardRef = UIStoryboard(name: StoryboardReference.Product.rawValue, bundle: nil)
        let view = storyboardRef.instantiateViewController(withIdentifier: ViewControllerReference.ProductListingViewController.rawValue) as! ProductListingViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
