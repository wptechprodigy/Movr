//
//  UIColor+MovrColors.swift
//  Movr
//
//  Created by waheedCodes on 11/12/2022.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static let backgroundColor: UIColor = .rgb(red: 25, green: 25, blue: 25)
    static let mainBlueTintColor: UIColor = .rgb(red: 17, green: 154, blue: 237)
}
