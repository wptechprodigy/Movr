//
//  UITextField+textfieldWithPlaceholder.swift
//  Movr
//
//  Created by waheedCodes on 10/12/2022.
//

import UIKit

extension UITextField {
    
    static func textfield(withPlaceholder placeholder: String, isSecureTextEntry: Bool = false) -> UITextField {
        let textField = UITextField()
        
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .white
        textField.keyboardAppearance = .dark
        textField.isSecureTextEntry = isSecureTextEntry
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return textField
    }
}
