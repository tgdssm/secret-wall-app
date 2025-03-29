//
//  AuthCoordinator.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

import UIKit


class AuthCoordinator: Coordinator, AuthViewControllerDelegate {
    internal var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController, parentCoordinator: AppCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        showSignInScreen()
    }
}

extension AuthCoordinator {
    func showSignInScreen() {
        let vc = AuthViewController()
        vc.coordinator = self
        vc.viewModel = AuthViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func navigateToOnboarding() {
        parentCoordinator?.navigateToOnboarding()
    }
}
