//
//  UIView+InputContainerView.swift
//  Movr
//
//  Created by waheedCodes on 10/12/2022.
//

import UIKit

extension UIView {
    
    /// Creates a container view for inputs with image, textfield and a separator
    /// - Parameters:
    ///   - imageName: system name of the image (SF Symbols)
    ///   - textfield: textfield object
    /// - Returns: a view with both objects
    static func inputContainerView(withImage imageName: String, and textfield: UITextField) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView(image: .init(systemName: imageName))
        imageView.tintColor = .lightGray
        imageView.alpha = 0.87
        
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(textfield)
        textfield.centerY(inView: view)
        textfield.anchor(left: imageView.rightAnchor, paddingLeft: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        view.addSubview(separatorView)
        separatorView.anchor(right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 8, paddingLeft: 8, height: 0.75)
        
        return view
    }
}
