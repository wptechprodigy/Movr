//
//  SignUpViewController.swift
//  Movr
//
//  Created by waheedCodes on 11/12/2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
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
    
    private lazy var fullnameContainerView: UIView = {
        let view = UIView
            .inputContainerView(
                withImage: "person",
                and: self.fullnameTextField
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
    
    private lazy var driverOrRiderContainerView: UIView = {
        let view = UIView
            .inputContainerView(
                withImage: "person.crop.square.fill",
                segmentedControl: self.accountTypeSegmentedControl
            )
        view.height(ofSize: 90)
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Email")
    }()
    
    private let fullnameTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Fullname")
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField.textfield(withPlaceholder: "Password",
                                     isSecureTextEntry: true)
    }()
    
    private let accountTypeSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Rider", "Driver"])
        segmentedControl.backgroundColor = .backgroundColor
        segmentedControl.tintColor = UIColor(white: 1, alpha: 0.87)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.height(ofSize: 24)
        return segmentedControl
    }()
    
    private lazy var signupButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var alreadyHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(
            string: "Already have an account? ",
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        attributedTitle.append(
            NSAttributedString(
                string: "Log In",
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14),
                    NSAttributedString.Key.foregroundColor: UIColor.mainBlueTintColor
                ]
            )
        )
        button.addTarget(self, action: #selector(didTapLogIn(_:)), for: .touchUpInside)
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc private func handleSignUp(_ sender: UIButton) {
        guard
            let email = emailTextField.text,
            let fullname = fullnameTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        let accountTypeIndex = accountTypeSegmentedControl.selectedSegmentIndex
        
        Auth
            .auth()
            .createUser(
                withEmail: email,
                password: password
            ) { (result, error) in
                if let error = error {
                    print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
                    return
                }
                
                guard let uuid = result?.user.uid else { return }
                
                let userDetails: [String: Any] = [
                    "email": email,
                    "fullname": fullname,
                    "accountType": accountTypeIndex
                ]
                
                Database
                    .database()
                    .reference()
                    .child("users")
                    .child(uuid)
                    .updateChildValues(userDetails) { error, ref in
                        print("Successfully registered user and saved data.")
                    }
                self.dismiss(animated: true)
            }
    }
    
    @objc private func didTapLogIn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func configureUI() {
        view.backgroundColor = .backgroundColor
        layoutTitle()
        stackInputContainers(in: view)
        layoutAlreadsyHaveAnAccountButton()
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
                fullnameContainerView,
                passwordContainerView,
                driverOrRiderContainerView,
                signupButton
            ]
        )
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, right: view.rightAnchor,
                     left: view.leftAnchor, paddingTop: 40,
                     paddingRight: 16, paddingLeft: 16)
    }
    
    private func layoutAlreadsyHaveAnAccountButton() {
        view.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.centerX(inView: view)
        alreadyHaveAnAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
    }
}
