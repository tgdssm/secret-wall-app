//
//  AuthFactory.swift
//  SecretWall
//
//  Created by Thalisson Melo on 04/04/25.
//

import Foundation

struct AuthFactory {
    static func makeAuthViewController(coordinator: AuthViewControllerDelegate) -> AuthViewController {
        let service = AuthServiceImpl(session: URLSession.shared)
        let viewModel = AuthViewModel(authService: service)
        let vc = AuthViewController()
        vc.viewModel = viewModel
        vc.coordinator = coordinator
        return vc
    }
}
