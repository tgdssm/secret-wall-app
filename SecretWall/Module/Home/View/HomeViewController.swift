//
//  OnboardingViewController.swift
//  SecretWall
//
//  Created by Thalisson Melo on 29/03/25.
//

import UIKit

class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?
    var viewModel: HomeViewModel!
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        guard view is HomeView else { return }

    }
}

extension HomeViewController: HomeViewModelDelegate {
    func didRequestHome() {
        delegate?.navigateToHome()
    }
}
