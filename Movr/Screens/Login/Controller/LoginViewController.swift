//
//  LoginViewController.swift
//  Movr
//
//  Created by waheedCodes on 07/12/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel: TitleLabel = {
        return TitleLabel()
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
    
    private let loginButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Log In", for: .normal)
        return button
    }()
    
    private lazy var dontHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(
            string: "Don't have an account? ",
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        attributedTitle.append(
            NSAttributedString(
                string: "Sign Up",
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                    NSAttributedString.Key.foregroundColor: UIColor.mainBlueTintColor
                ]
            )
        )
        button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc private func didTapSignUp(_ sender: UIButton) {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func configureUI() {
        view.backgroundColor = .backgroundColor
        configureNavigationBar()
        layoutTitle()
        stackInputContainers(in: view)
        layoutDontHaveAnAccountButton()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    private func layoutTitle() {
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
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
    
    private func layoutDontHaveAnAccountButton() {
        view.addSubview(dontHaveAnAccountButton)
        dontHaveAnAccountButton.centerX(inView: view)
        dontHaveAnAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
}
