//
//  OnboardingCoordinator.swift
//  SecretWall
//
//  Created by Thalisson Melo on 29/03/25.
//

import UIKit

class HomeCoordinator: Coordinator, HomeViewControllerDelegate {
    internal var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController, parentCoordinator: AppCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    
    func start() {
        showHome()
    }
}

extension HomeCoordinator {
    func showHome() {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel()
        vc.delegate = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func navigateToHome() {
    }
}
