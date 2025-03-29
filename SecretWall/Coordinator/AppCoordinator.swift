//
//  AppCoordinator.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

class AppCoordinator: Coordinator {
    internal var navigationController: UINavigationController
    internal var window: UIWindow!
    
    var starterCoordinator: Coordinator?
    
    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        starterCoordinator = AuthCoordinator(navigationController: navigationController, parentCoordinator: self)
        setupWindow()
    }
    
    func setupWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        starterCoordinator?.start()
    }
    
    func navigateToOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController, parentCoordinator: self)
        onboardingCoordinator.start()
    }
}
