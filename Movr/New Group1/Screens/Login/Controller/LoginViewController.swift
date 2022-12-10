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
        return UIView
            .inputContainerView(
                withImage: "envelope",
                and: emailTextField
            )
    }()
    
    private lazy var passwordContainerView: UIView = {
        return UIView
            .inputContainerView(
                withImage: "lock",
                and: passwordTextField
            )
    }()
    
    private let emailTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Email")
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Password",
                                     isSecureTextEntry: true)
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1.0)
        
        view.addSubview(titleLabel)
        view.addSubview(emailContainerView)
        view.addSubview(passwordContainerView)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        emailContainerView.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 40, paddingRight: 16, paddingLeft: 16, height: 50)
        
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 16, paddingRight: 16, paddingLeft: 16, height: 50)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
