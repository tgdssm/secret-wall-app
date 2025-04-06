//
//  AuthViewModel.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

class AuthViewModel {
    weak var delegate: AuthViewModelDelegate?
    let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    func loginWithApple(identityToken: String) {
        delegate?.startLoading()
        Task {
            do {
                let response = try await authService.loginWithApple(authRequest: AuthRequest(identityToken: identityToken))
                try KeychainStorage.saveAccessToken(response.accessToken, service: "access-token", account: "apple-auth")
                delegate?.stopLoading()
                navigateToHome()
            } catch {
                delegate?.showError()
                delegate?.stopLoading()
            }
        }
    }
}

extension AuthViewModel {
    private func navigateToHome() {
        delegate?.navigateToHome()
    }
}
