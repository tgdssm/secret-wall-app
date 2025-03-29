//
//  OnboardingViewController.swift
//  SecretWall
//
//  Created by Thalisson Melo on 29/03/25.
//

import UIKit

class OnboardingViewController: UIViewController {
    weak var delegate: OnboardingViewControllerDelegate?
    var viewModel: OnboardingViewModel!
    
    override func loadView() {
        view = OnboardingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        guard let onboardingView = view as? OnboardingView else { return }

    }
}

extension OnboardingViewController: OnboardingViewModelDelegate {
    func didRequestHome() {
        delegate?.navigateToHome()
    }
}
