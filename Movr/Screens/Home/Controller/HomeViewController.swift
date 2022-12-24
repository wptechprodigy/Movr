//
//  HomeViewController.swift
//  Movr
//
//  Created by waheedCodes on 13/12/2022.
//

import UIKit
import Firebase
import MapKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let mapview = MKMapView()
    private let locationManager = CLLocationManager()
    
    private let locationInputActivationView = LocationInputActivationView()
    private let locationInputView = LocationInputView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        locationInputActivationView.delegate = self
        enableLocationServices()
//        signOut()
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
            self.configureUI()
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out.")
        }
    }
    
    // MARK: - Helper Methods
    
    func configureUI() {
        configureMapView()
        showWithAnimation(view: self.locationInputActivationView, for: 2)
    }
    
    private func configureMapView() {
        view.addSubview(mapview)
        mapview.frame = view.frame
        
        showAndFollowUserLocation()
        configureLocationInputActivationView()
    }
    
    private func showAndFollowUserLocation() {
        mapview.showsUserLocation = true
        mapview.userTrackingMode = .follow
    }
    
    private func configureLocationInputActivationView() {
        view.addSubview(locationInputActivationView)
        locationInputActivationView.centerX(inView: view)
        locationInputActivationView.setDimensions(width: view.frame.width - 64, height: 58)
        locationInputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
    }
    
    private func configureLocationInputView() {
        self.locationInputActivationView.alpha = 0
        view.addSubview(locationInputView)
        locationInputView.delegate = self
        locationInputView.anchor(top: view.topAnchor, right: view.rightAnchor,
                                 left: view.leftAnchor, height: 200)
        
        showWithAnimation(view: self.locationInputView, for: 0.5) { _ in
            print("DEBUG: List of suggestions can now be presented...")
        }
    }
}

// MARK: - Location Services

extension HomeViewController: CLLocationManagerDelegate {
    func enableLocationServices() {
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}

// MARK: - LocationInputActivationViewDelegate

extension HomeViewController: LocationInputActivationViewDelegate {
    func presentLocationInputView() {
        configureLocationInputView()
    }
}

// MARK: - LocationInputViewDelegate

extension HomeViewController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3) {
            self.locationInputView.alpha = 0
        } completion: { _ in
            self.showWithAnimation(view: self.locationInputActivationView,
                                   for: 0.3)
        }
    }
}
