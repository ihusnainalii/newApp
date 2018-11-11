//
//  SearchViewController.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchCollection: UICollectionView!
    
    // MARK:- Chnage Sttaus bar to light color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Variables
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Confirm Delegate
        searchText.delegate = self
        
        // User interaction
        searchButton.isUserInteractionEnabled = false
    }
    
    // MARK: - Navigation
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnCancelSearchTapped(_ sender: UIButton) {
        searchText.text = ""
        searchText.resignFirstResponder()
        searchButton.setImage(UIImage(named: "searchBlack"), for: .normal)
        searchButton.isUserInteractionEnabled = false
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchText {
            searchButton.setImage(UIImage(named: "close"), for: .normal)
            searchButton.isUserInteractionEnabled = true
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchText {
            searchText.text = ""
            searchText.resignFirstResponder()
            searchButton.setImage(UIImage(named: "searchBlack"), for: .normal)
            searchButton.isUserInteractionEnabled = false
        }
        return false
    }
}

