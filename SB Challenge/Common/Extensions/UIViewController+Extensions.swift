//
//  UIViewController+Extensions.swift
//  SB Challenge
//
//  Created by George Kiplagat on 04/12/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert( _ message: String, dismissed: ((Bool) -> ())? ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style:
                                        UIAlertAction.Style.cancel) {
                                           UIAlertAction in
                                           dismissed?(true)
                                        })
        
        self.present(alert, animated: true, completion: nil)
    }
}
