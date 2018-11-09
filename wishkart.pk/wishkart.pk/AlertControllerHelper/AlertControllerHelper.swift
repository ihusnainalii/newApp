//
//  AlertControllerHelper.swift
//  wishkart.pk
//
//  Created by Husnain on 11/9/18.
//  Copyright © 2018 Husnain. All rights reserved.
//

import Foundation
import UIKit

class AlertControllerHelper {
    
    //MARK: - Swift Alert
    private class func notificationAlert(message:String, viewController : UIViewController) {
        
        let alertController = UIAlertController(title: appName, message: message, preferredStyle: .alert)
        let successAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(successAction)
        //alertController.view.tintColor = appColor
        viewController.present(alertController, animated: true, completion:nil)
    }
    
    //MARK: - functions to display alert
    class func displayAlert(message:String, viewController : UIViewController) {
        notificationAlert(message: message, viewController: viewController)
    }
}
