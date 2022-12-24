//
//  LocationInputActivationView.swift
//  Movr
//
//  Created by waheedCodes on 23/12/2022.
//

import UIKit

class LocationInputActivationView: UIView {
    
    // MARK: - Properties
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray5
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Methods
    
    private func setUpSubviews() {
        setUpSelfAttributes()
        setUpIndicatorView()
        setUpPlaceholderView()
        addTapGestureRecognition()
    }
    
    private func setUpSelfAttributes() {
        backgroundColor = .white
        alpha = 0
        layer.cornerRadius = 8
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.55
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
    
    private func setUpIndicatorView() {
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(width: 6, height: 6)
    }
    
    private func setUpPlaceholderView() {
        addSubview(placeholderLabel)
        placeholderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
    }
    
    private func addTapGestureRecognition() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(self.handleTap(_:))
        )
        addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Selectors
    
    @objc func handleTap(_ sender: UIView) {
        print("Tapping recognoized")
    }
}
