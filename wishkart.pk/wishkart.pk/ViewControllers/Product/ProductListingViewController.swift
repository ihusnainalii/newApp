//
//  ProductListingViewController.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class ProductListingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var cartCountView: UIView!
    @IBOutlet weak var cartCountLabel: UILabel!
    @IBOutlet weak var productCollection: UICollectionView!
    @IBOutlet weak var topStack: UIStackView!
    
    // MARK: - Constraint IBOutlets
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    // MARK:- Chnage Sttaus bar to light color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Variables
    var isLatestProducts = false
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if isLatestProducts {
            topConstraint.constant = 48
            topStack.isHidden = false
        }else{
            topConstraint.constant = 5
            topStack.isHidden = true
        }
        
        // Views Settings
        cartCountView.layer.cornerRadius = cartCountView.bounds.height / 2
        cartCountView.setBorder(radius: cartCountView.bounds.height / 2, color: .white)
        
        // Collection view settings
        productCollection.clearBackground()
        productCollection.updateStyleOneCollectionViewFLow()
        productCollection.delegate = self
        productCollection.dataSource = self
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
    @IBAction func btnSortTapped(_ sender: UIButton) {
    }
    @IBAction func btnFilterTapped(_ sender: UIButton) {
    }
}

extension ProductListingViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Register Cell
        self.productCollection.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
        
        // Cell
        let cell = productCollection.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath as IndexPath) as! ProductCell
        
        // Cell Settings
        let height = productCollection.bounds.height / 2
        let size = (height / 100) * 60
        cell.imageHeightConstraint.constant = size
        
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = appBorderColor.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (productCollection.bounds.width / 2) - 3
        let height = productCollection.bounds.height / 2
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
