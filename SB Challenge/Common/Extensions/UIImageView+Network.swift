//
//  UIImageView+Network.swift
//  SB Challenge
//
//  Created by George Kiplagat on 05/12/2022.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImage(withUrlString urlString: String, placeholderImage: UIImage? = nil) {
        
        image = placeholderImage
        
        if let url = URL(string: urlString) {
            af_setImage(withURL: url)
        }
    }
}
