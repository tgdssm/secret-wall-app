//
//  AuthFactory.swift
//  SecretWall
//
//  Created by Thalisson Melo on 04/04/25.
//

struct AuthFactory {
    static func makeAuthViewController(coordinator: AuthViewControllerDelegate) -> AuthViewController {
        let service = AuthServiceImpl()
        let viewModel = AuthViewModel(authService: service)
        let vc = AuthViewController()
        vc.viewModel = viewModel
        vc.coordinator = coordinator
        return vc
    }
}
