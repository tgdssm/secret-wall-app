//
//  AuthViewController.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

import UIKit
import AuthenticationServices

class AuthViewController: UIViewController {
    var viewModel: AuthViewModel!
    weak var coordinator: AuthViewControllerDelegate?
    
    override func loadView() {
        self.view = AuthView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        guard let authView = self.view as? AuthView else { return }
        authView.signInButton.addTarget(self, action: #selector(actionSignInButton), for: .touchUpInside)
        
    }
    
    @objc func actionSignInButton() {
        let authProvider = ASAuthorizationAppleIDProvider()
        let request = authProvider.createRequest()
        request.requestedScopes = []
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

extension AuthViewController: AuthViewModelDelegate {
    func navigateToOnboarding() {
        coordinator?.navigateToOnboarding()
    }
}

extension AuthViewController: ASAuthorizationControllerDelegate {
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8) ?? ""
            viewModel.loginWithApple(identityToken: identityToken)
        default:
            break
        }
    }
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {}
}

extension AuthViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        self.view.window!
    }
}
