//
//  LocationInputView.swift
//  Movr
//
//  Created by waheedCodes on 24/12/2022.
//

import UIKit

protocol LocationInputViewDelegate: AnyObject {
    func dismissLocationInputView()
}

class LocationInputView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: LocationInputViewDelegate?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button
            .setImage(
                UIImage(systemName: "arrow.left")?
                    .withRenderingMode(.alwaysOriginal),
                for: .normal)
        button.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc private func backButtonDidTap(_ sender: UIButton) {
        delegate?.dismissLocationInputView()
    }
    
    // MARK: - Helper Methods
    
    private func setUpSubview() {
        setUpSelfAttributes()
        applyShadows()
        setUpBackButton()
    }
    
    private func setUpSelfAttributes() {
        backgroundColor = .white
    }
    
    private func setUpBackButton() {
        addSubview(backButton)
        backButton.anchor(top: topAnchor, left: leftAnchor,
                          paddingTop: 44, paddingLeft: 8,
                          width: 24, height: 26)
    }
}
