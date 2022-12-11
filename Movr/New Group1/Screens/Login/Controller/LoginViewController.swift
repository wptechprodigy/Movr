//
//  LoginViewController.swift
//  Movr
//
//  Created by waheedCodes on 07/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MOVR"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView
            .inputContainerView(
                withImage: "envelope",
                and: self.emailTextField
            )
        view.height(ofSize: 50)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView
            .inputContainerView(
                withImage: "lock",
                and: self.passwordTextField
            )
        view.height(ofSize: 50)
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Email")
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Password",
                                     isSecureTextEntry: true)
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.height(ofSize: 50)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.8), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .mainBlueTintColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        stackInputContainers(in: view)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func stackInputContainers(in view: UIView) {
        let stack = UIStackView(
            arrangedSubviews: [
                emailContainerView,
                passwordContainerView,
                loginButton
            ]
        )
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 40, paddingRight: 16, paddingLeft: 16)
    }
}
