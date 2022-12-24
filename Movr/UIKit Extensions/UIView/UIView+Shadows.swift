//
//  UIView+Shadows.swift
//  Movr
//
//  Created by waheedCodes on 24/12/2022.
//

import UIKit

extension UIView {
    
    func applyShadows() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
}
