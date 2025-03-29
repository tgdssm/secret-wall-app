//
//  OnboardingCoordinator.swift
//  SecretWall
//
//  Created by Thalisson Melo on 29/03/25.
//

import UIKit

class OnboardingCoordinator: Coordinator, OnboardingViewControllerDelegate {
    internal var navigationController: UINavigationController
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController, parentCoordinator: AppCoordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    
    func start() {
        showOnboarding()
    }
}

extension OnboardingCoordinator {
    func showOnboarding() {
        let vc = OnboardingViewController()
        vc.viewModel = OnboardingViewModel()
        vc.delegate = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func navigateToHome() {
    }
}
