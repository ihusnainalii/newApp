//
//  Globals.swift
//  wishkart.pk
//
//  Created by Husnain on 11/9/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - TypeAlias for Completion Block
typealias CompletionNetwork = (_ message: String,_ success: Bool) -> Void
typealias CompletionNetworkClasses = (_ message: String,_ success: Bool,_ isBooked: Bool) -> Void
typealias CompletionNetworkForLogin = (_ message: String,_ success: Bool,_ userID: String,_ accessToken: String) -> Void
typealias CompletionNetworkUpdateFCM = (_ message: String,_ success: Bool,_ accessToken: String) -> Void
typealias CompletionNetworkWithJson = (_ message: String,_ success: Bool,_ jsonData: JSON?) -> Void
typealias CompletionAnimation = (_ success: Bool) -> Void

enum PushType:Int{
    //MARK: - Return which type of push is
    case newClass = 1
    case undefined=945
}

// MARK: - Enum for Storyboard Reference
enum StoryboardReference: String {
    case Main
    case Brand
    case Product
    case Search
}

enum ViewControllerReference: String {
    //Main
    case HomeViewController
    case BrandListViewController
    case ProductListingViewController
    case SearchViewController
}

// MARK: - Enum for Navigation Controllers Reference
enum NavigationReference: String {
    case mainNavigation
}
