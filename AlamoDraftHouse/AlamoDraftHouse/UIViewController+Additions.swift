//
//  UIViewController+Additions.swift
//  AlamoDraftHouse
//
//  Created by William Farmerie on 9/9/17.
//  Copyright © 2017 William Farmerie. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  
  func showError(errorString: String?) {
    let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertControllerStyle.alert)
    
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
      (result : UIAlertAction) -> Void in
      
    }
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
