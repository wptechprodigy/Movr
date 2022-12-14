//
//  HomeViewController.swift
//  Movr
//
//  Created by waheedCodes on 13/12/2022.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        view.backgroundColor = .cyan
    }
    
    // MARK: - API
    
    private func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let rootVC = LoginViewController()
                let navigationController = UINavigationController(rootViewController: rootVC)
                navigationController.modalPresentationStyle = .fullScreen
                self.present(navigationController, animated: true)
            }
        } else {
            print("DEBUG: User with uuid: \(String(describing: Auth.auth().currentUser?.uid)) is logged in.")
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out.")
        }
    }
}
