//
//  AuthButton.swift
//  Movr
//
//  Created by waheedCodes on 11/12/2022.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        height(ofSize: 50)
        setTitleColor(UIColor(white: 1, alpha: 0.8), for: .normal)
        layer.cornerRadius = 8
        backgroundColor = .mainBlueTintColor
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
