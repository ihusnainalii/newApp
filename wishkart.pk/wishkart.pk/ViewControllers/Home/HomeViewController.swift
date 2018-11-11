//
//  HomeViewController.swift
//  wishkart.pk
//
//  Created by Husnain on 11/11/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit
import MBProgressHUD
import Kingfisher
import TRMosaicLayout

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var categoeiesListView: UIView!
    // cart
    @IBOutlet weak var cartCountView: UIView!
    @IBOutlet weak var cartCountLabel: UILabel!
    
    // Slider
    @IBOutlet weak var imageSlider: AACarousel!
    
    // Table View
    @IBOutlet weak var lastestProducts: UITableView!
    @IBOutlet weak var sportBooks: UITableView!
    
    // Collection Views
    @IBOutlet weak var categoriesList: UICollectionView!
    @IBOutlet weak var featureBrandList: UICollectionView!
    @IBOutlet weak var categoriesCellList: UICollectionView!
    @IBOutlet weak var promotions: UICollectionView!
    @IBOutlet weak var hotDeals: UICollectionView!
    @IBOutlet weak var topBrandList: UICollectionView!
    @IBOutlet weak var electronics: UICollectionView!
    @IBOutlet weak var menFashion: UICollectionView!
    @IBOutlet weak var womenFashion: UICollectionView!
    @IBOutlet weak var appliances: UICollectionView!
    @IBOutlet weak var furniture: UICollectionView!
    @IBOutlet weak var babyToys: UICollectionView!
    @IBOutlet weak var recommended: UICollectionView!
    
    // Constraint IBOutlets
    @IBOutlet weak var categoriesViewConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    var sliderPageControlPosition = 4
    var categories = ["Electronics", "Men's Fashion", "Women's Fashion", "TV & Appliances", "Home & Furniture", "Sports, Books & more", "Baby, Toys & Kids", "Sales"]
    var banners = ["b1", "b2", "b3", "b4"]
    
    ///MARK:- Chnage Sttaus bar to light color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        confirmDelegates()
        registerNibs()
        setupImageSlider()
    }

    // MArk: - Setup View
    private func setupView() {
        // Views Settings
        cartCountView.layer.cornerRadius = cartCountView.bounds.height / 2
        cartCountView.setBorder(radius: cartCountView.bounds.height / 2, color: .white)
        
        // Constraints updates
        let width = UIScreen.main.bounds.width
        categoriesViewConstraint.constant = ((width / 4) * 2) + 50
        
        // Collection views Settings
        collectionViewSettings()
    }
    
    // MARK: - collection View Settings
    private func collectionViewSettings() {
        // Clear Backgrounds
        featureBrandList.clearBackground()
        topBrandList.clearBackground()
        promotions.clearBackground()
        hotDeals.clearBackground()
        menFashion.clearBackground()
        womenFashion.clearBackground()
        electronics.clearBackground()
        appliances.clearBackground()
        furniture.clearBackground()
        babyToys.clearBackground()
        recommended.clearBackground()
        
        // Flow layouts
        featureBrandList.updateHorizontalCollectionViewFLow()
        categoriesList.updateHorizontalCollectionViewFLow()
        babyToys.updateHorizontalCollectionViewFLow()
        categoriesCellList.updateZeroCollectionViewFLow()
        hotDeals.updateStyleOneCollectionViewFLow()
        electronics.updateStyleOneCollectionViewFLow()
        womenFashion.updateStyleOneCollectionViewFLow()
        appliances.updateStyleOneCollectionViewFLow()
        furniture.updateStyleOneCollectionViewFLow()
        recommended.updateStyleOneCollectionViewFLow()
        
        // Mosaic Layout
        let mosaicLayout = TRMosaicLayout()
        menFashion?.collectionViewLayout = mosaicLayout
        mosaicLayout.delegate = self
    }
    
    // MARK: - confirm Delegates
    private func confirmDelegates() {
        // Collection Views
        confirmDelegate(collectionView: categoriesList)
        confirmDelegate(collectionView: featureBrandList)
        confirmDelegate(collectionView: categoriesCellList)
        confirmDelegate(collectionView: promotions)
        confirmDelegate(collectionView: hotDeals)
        confirmDelegate(collectionView: topBrandList)
        confirmDelegate(collectionView: electronics)
        confirmDelegate(collectionView: menFashion)
        confirmDelegate(collectionView: womenFashion)
        confirmDelegate(collectionView: appliances)
        confirmDelegate(collectionView: furniture)
        confirmDelegate(collectionView: babyToys)
        confirmDelegate(collectionView: recommended)
        
        // Table Views
        confirmTableDelegate(table: lastestProducts)
        confirmTableDelegate(table: sportBooks)
    }
    
    // MARK: - Register Nibs to use in tableView
    private func registerNibs() {
        registerNib(table: lastestProducts, cellIdentifire: ProductListCell.identifier)
        registerNib(table: sportBooks, cellIdentifire: ProductListCell.identifier)
    }
    
    // MARK: - confirm Delegate
    private func confirmDelegate(collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - confirm Delegate
    private func confirmTableDelegate(table: UITableView) {
        table.delegate = self
        table.dataSource = self
    }
    
    // MARK: - Register Nib
    private func registerNib(table: UITableView, cellIdentifire: String) {
        let nib  = UINib(nibName: cellIdentifire, bundle: nil)
        table.register(nib, forCellReuseIdentifier: cellIdentifire)
    }
    
    // MARK: - setup Image Slider
    private func setupImageSlider(){
        var isSingle = false
        imageSlider.delegate = self
        var imageArray = [String]()
        
        if imageArray.count == 0 {
            imageArray.append("b1")
            imageArray.append("b2")
            imageArray.append("b3")
            imageArray.append("b4")
//            isSingle = true
            isSingle = false
        }
        
        imageSlider.setCarouselData(paths: imageArray, describedTitle: imageArray, isAutoScroll: true, timer: 5, defaultImage: "logo")
        imageSlider.setCarouselOpaque(layer: true, describedTitle: true, pageIndicator: isSingle ? true : false)
        imageSlider.setCarouselLayout(displayStyle: 1, pageIndicatorPositon: self.sliderPageControlPosition, pageIndicatorColor: appColor, describedTitleColor: nil, layerColor: nil)
    }
    
    // MARK: - IBActions
    @IBAction func btnMenuTapped(_ sender: UIButton) {
    }
    @IBAction func btnSearchTapped(_ sender: UIButton) {
        let storyboardRef = UIStoryboard(name: StoryboardReference.Search.rawValue, bundle: nil)
        let view = storyboardRef.instantiateViewController(withIdentifier: ViewControllerReference.SearchViewController.rawValue) as! SearchViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
    @IBAction func btnCartTapped(_ sender: UIButton) {
    }
    @IBAction func btnFeaturedBrandsTapped(_ sender: UIButton) {
        let storyboardRef = UIStoryboard(name: StoryboardReference.Brand.rawValue, bundle: nil)
        let view = storyboardRef.instantiateViewController(withIdentifier: ViewControllerReference.BrandListViewController.rawValue) as! BrandListViewController
        view.isFeatured = true
        self.navigationController?.pushViewController(view, animated: true)
    }
    @IBAction func btnHotDealsTapped(_ sender: UIButton) {
    }
    @IBAction func btnTopBrandsTapped(_ sender: UIButton) {
        let storyboardRef = UIStoryboard(name: StoryboardReference.Brand.rawValue, bundle: nil)
        let view = storyboardRef.instantiateViewController(withIdentifier: ViewControllerReference.BrandListViewController.rawValue) as! BrandListViewController
        view.isFeatured = false
        self.navigationController?.pushViewController(view, animated: true)
    }
    @IBAction func btnLatestProductsTapped(_ sender: UIButton) {
        self.productNavigation(isLatest: true)
    }
    @IBAction func btnMensFashionTapped(_ sender: UIButton) {
    }
    @IBAction func btnAppliancesTapped(_ sender: UIButton) {
    }
    @IBAction func btnFurnitureTapped(_ sender: UIButton) {
    }
    @IBAction func btnSportTapped(_ sender: UIButton) {
    }
    
    
    // MARK: - Custom Functions
    private func productNavigation(isLatest: Bool) {
        let storyboardRef = UIStoryboard(name: StoryboardReference.Product.rawValue, bundle: nil)
        let view = storyboardRef.instantiateViewController(withIdentifier: ViewControllerReference.ProductListingViewController.rawValue) as! ProductListingViewController
        view.isLatestProducts = isLatest
        self.navigationController?.pushViewController(view, animated: true)
    }
}

extension HomeViewController: TRMosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, mosaicCellSizeTypeAtIndexPath indexPath: IndexPath) -> TRMosaicCellType {
        // I recommend setting every third cell as .Big to get the best layout
        return indexPath.item % 3 == 0 ? TRMosaicCellType.big : TRMosaicCellType.small
    }
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout: TRMosaicLayout, insetAtSection:Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    func heightForSmallMosaicCell() -> CGFloat {
        return self.menFashion.bounds.height / 2
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == lastestProducts {
            let cell = lastestProducts.dequeueReusableCell(withIdentifier: ProductListCell.identifier, for: indexPath) as! ProductListCell
            
            return cell
        }else if tableView == sportBooks {
            let cell = sportBooks.dequeueReusableCell(withIdentifier: ProductListCell.identifier, for: indexPath) as! ProductListCell
            
            return cell
        }else{
            let cell = UITableViewCell()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == lastestProducts {
            return self.lastestProducts.bounds.height / 4
        }else if tableView == sportBooks {
            return self.sportBooks.bounds.height / 4
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesList {
            return categories.count
        }else if collectionView == featureBrandList {
            return 8
        }else if collectionView == categoriesList {
            return categories.count
        }else if collectionView == promotions {
            return banners.count
        }else if collectionView == hotDeals || collectionView == electronics || collectionView == womenFashion || collectionView == furniture {
            return 4
        }else if collectionView == topBrandList {
            return 8
        }else if collectionView == menFashion {
            return 3
        }else if collectionView == appliances {
            return 6
        }else if collectionView == babyToys {
            return 6
        }else if collectionView == recommended {
            return 8
        }else{
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesList {
            // Register Cell
            self.categoriesList.register(UINib(nibName: CategoryCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
            
            // Cell
            let cell = categoriesList.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath as IndexPath) as! CategoryCollectionCell
            
            cell.textLabel.text = categories[indexPath.row]
            
            return cell
        }else if collectionView == featureBrandList {
            // Register Cell
            self.featureBrandList.register(UINib(nibName: FeatureBrandCell.identifier, bundle: nil), forCellWithReuseIdentifier: FeatureBrandCell.identifier)
            
            // Cell
            let cell = featureBrandList.dequeueReusableCell(withReuseIdentifier: FeatureBrandCell.identifier, for: indexPath as IndexPath) as! FeatureBrandCell
            cell.layer.cornerRadius = 5
            return cell
        }else if collectionView == categoriesCellList {
            // Register Cell
            self.categoriesCellList.register(UINib(nibName: CategoriesCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionCell.identifier)
            
            // Cell
            let cell = categoriesCellList.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionCell.identifier, for: indexPath as IndexPath) as! CategoriesCollectionCell
            
            cell.cateLabel.text = categories[indexPath.row]
            return cell
        }else if collectionView == promotions {
            // Register Cell
            self.promotions.register(UINib(nibName: PromotionsCell.identifier, bundle: nil), forCellWithReuseIdentifier: PromotionsCell.identifier)
            
            // Cell
            let cell = promotions.dequeueReusableCell(withReuseIdentifier: PromotionsCell.identifier, for: indexPath as IndexPath) as! PromotionsCell
            
            cell.promoImage.image = UIImage(named: banners[indexPath.row])
            return cell
        }else if collectionView == hotDeals || collectionView == electronics || collectionView == womenFashion || collectionView == furniture {
            // Register Cell
            self.hotDeals.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
            
            // Cell
            let cell = hotDeals.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath as IndexPath) as! ProductCell
            
            // Cell Settings
            let height = hotDeals.bounds.height / 2
            let size = (height / 100) * 60
            cell.imageHeightConstraint.constant = size
            
            cell.layer.cornerRadius = 5
            return cell
        }else if collectionView == topBrandList {
            // Register Cell
            self.topBrandList.register(UINib(nibName: FeatureBrandCell.identifier, bundle: nil), forCellWithReuseIdentifier: FeatureBrandCell.identifier)
            
            // Cell
            let cell = topBrandList.dequeueReusableCell(withReuseIdentifier: FeatureBrandCell.identifier, for: indexPath as IndexPath) as! FeatureBrandCell
            cell.layer.cornerRadius = 5
            return cell
        }else if collectionView == menFashion {
            if indexPath.row == 0 {
                // Register Cell
                self.menFashion.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
                
                // Cell
                let cell = menFashion.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath as IndexPath) as! ProductCell
                
                // Cell Settings
                let height = hotDeals.bounds.height / 2
                let size = (height / 100) * 60
                cell.imageHeightConstraint.constant = size
                
                cell.layer.cornerRadius = 5
                return cell
            }else{
                // Register Cell
                self.menFashion.register(UINib(nibName: ProductCellTwo.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCellTwo.identifier)
                
                // Cell
                let cell = menFashion.dequeueReusableCell(withReuseIdentifier: ProductCellTwo.identifier, for: indexPath as IndexPath) as! ProductCellTwo
                
                let height = cell.bounds.height
                let size = (height / 100) * 75
                cell.imageHeightConstraint.constant = size
                
                cell.layer.cornerRadius = 5
                return cell
            }
        }else if collectionView == appliances {
            // Register Cell
            self.appliances.register(UINib(nibName: ProductCellTwo.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCellTwo.identifier)
            
            // Cell
            let cell = appliances.dequeueReusableCell(withReuseIdentifier: ProductCellTwo.identifier, for: indexPath as IndexPath) as! ProductCellTwo
            
            let height = cell.bounds.height
            let size = (height / 100) * 75
            cell.imageHeightConstraint.constant = size
            
            cell.layer.cornerRadius = 5
            return cell
        }else if collectionView == babyToys {
            // Register Cell
            self.babyToys.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
            
            // Cell
            let cell = babyToys.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath as IndexPath) as! ProductCell
            
            // Cell Settings
            let height = hotDeals.bounds.height / 2
            let size = (height / 100) * 70
            cell.imageHeightConstraint.constant = size
            
            cell.layer.cornerRadius = 5
            return cell
        }else if collectionView == recommended {
            // Register Cell
            self.recommended.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
            
            // Cell
            let cell = recommended.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath as IndexPath) as! ProductCell
            
            // Cell Settings
            let height = hotDeals.bounds.height / 2
            let size = (height / 100) * 70
            cell.imageHeightConstraint.constant = size
            
            cell.layer.cornerRadius = 5
            cell.layer.borderColor = appBorderColor.cgColor
            cell.layer.borderWidth = 1
            
            return cell
        }else {
            let cell = UICollectionViewCell()
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesList {
            let width = categories[indexPath.row].widthOfString(usingFont: UIFont.systemFont(ofSize: 15.0, weight: .regular))
            return CGSize(width: width + 20, height: collectionView.bounds.height - 5)
        }else if collectionView == featureBrandList {
            return CGSize(width: 90, height: collectionView.bounds.height - 5)
        }else if collectionView == categoriesCellList {
            let width = categoeiesListView.bounds.width / 4
            let height = categoeiesListView.bounds.height / 2
            return CGSize(width: width, height: height)
        }else if collectionView == promotions {
            let width = promotions.bounds.width
            let height = promotions.bounds.height
            return CGSize(width: width, height: height)
        }else if collectionView == hotDeals {
            let screen = UIScreen.main.bounds.width - 40
            let width = (screen / 2) - 3
            let height = (collectionView.bounds.height / 2) - 2
            return CGSize(width: width, height: height)
        }else if collectionView == topBrandList {
            return CGSize(width: 90, height: collectionView.bounds.height - 5)
        }else if collectionView == menFashion {
            let cellWidth = (menFashion.bounds.width / 2) - 2
            let cellHeight = (menFashion.bounds.height / 2) - 2
            return CGSize(width: cellWidth, height: cellHeight)
        }else if collectionView == appliances {
            let cellWidth = (appliances.bounds.width / 3) - 5
            let cellHeight = (appliances.bounds.height / 2) - 2
            return CGSize(width: cellWidth, height: cellHeight)
        }else if collectionView == babyToys {
            let cellWidth = (babyToys.bounds.width / 2) - 2
            let cellHeight = babyToys.bounds.height
            return CGSize(width: cellWidth, height: cellHeight)
        }else if collectionView == electronics || collectionView == womenFashion || collectionView == furniture {
            let width = (electronics.bounds.width / 2) - 3
            let height = (electronics.bounds.height / 2) - 10
            return CGSize(width: width, height: height)
        }else if collectionView == recommended {
            let width = (recommended.bounds.width / 2) - 3
            let height = (recommended.bounds.height / 4) - 10
            return CGSize(width: width, height: height)
        }else {
            return CGSize(width: 90, height: collectionView.bounds.height - 5)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if collectionView == categoriesList {
            
        }else if collectionView == featureBrandList || collectionView == topBrandList {
            productNavigation(isLatest: false)
        }else if collectionView == categoriesCellList {
            
        }else if collectionView == promotions {
            
        }else if collectionView == hotDeals {
            
        }else if collectionView == electronics || collectionView == womenFashion || collectionView == furniture {
            
        }else if collectionView == menFashion {
            
        }else if collectionView == appliances {
            
        }else if collectionView == babyToys {
            
        }else if collectionView == electronics || collectionView == womenFashion || collectionView == furniture {
            
        }else if collectionView == recommended {
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - extension for image slider -> AA Carousel Delegate
extension HomeViewController: AACarouselDelegate {
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        imageView.kf.setImage(with: URL(string: url[index]), placeholder:  UIImage(named: "logo"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
    }
    
    func downloadImages(_ url: String, _ index: Int) {
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder:  UIImage(named: "logo"), options: [.transition(.fade(0))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            guard let image = downloadImage else { return }
            self.imageSlider.images[index] = image
        })
    }
}
