//
//  UITextView+Extensions.swift
//  SB Challenge
//
//  Created by George Kiplagat on 05/12/2022.
//

import Foundation
import UIKit

extension UITextView {
    
    func removeInsets(){
        self.textContainer.lineFragmentPadding = 0
        self.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
    
}
