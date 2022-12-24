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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
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
        configureInputActionView()
    }
    
    private func showAndFollowUserLocation() {
        mapview.showsUserLocation = true
        mapview.userTrackingMode = .follow
    }
    
    private func configureInputActionView() {
        view.addSubview(locationInputActivationView)
        locationInputActivationView.centerX(inView: view)
        locationInputActivationView.setDimensions(width: view.frame.width - 64, height: 58)
        locationInputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
    }
}

// MARK: - Location Services

extension HomeViewController: CLLocationManagerDelegate {
    func enableLocationServices() {
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            print("DEBUG: Not determined...")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            print("DEBUG: Always authorized...")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("DEBUG: Always when in use...")
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
