//
//  AppCoordinator.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func startFromAuth()
    func startFromHome()
}

class AppCoordinator: Coordinator {
    internal var navigationController: UINavigationController
    internal var window: UIWindow!
    
    var starterCoordinator: Coordinator?
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
    }
    
    func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func startFromAuth() {
        starterCoordinator = AuthCoordinator(navigationController: navigationController, parentCoordinator: self)
        starterCoordinator?.start()
    }
    
    func startFromHome() {
        starterCoordinator = HomeCoordinator(navigationController: navigationController, parentCoordinator: self)
        starterCoordinator?.start()
    }
    
    func navigateToHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController, parentCoordinator: self)
        homeCoordinator.start()
    }
}
