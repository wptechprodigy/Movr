//
//  TitleLabel.swift
//  Movr
//
//  Created by waheedCodes on 11/12/2022.
//

import UIKit

class TitleLabel: UILabel {

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Method
    
    private func configureLabel() {
        text = "MOVR"
        font = UIFont(name: "Avenir-Light", size: 36)
        textColor = UIColor(white: 1, alpha: 0.8)
    }
}
