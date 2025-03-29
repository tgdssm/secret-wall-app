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
//        authView.signInButton.addTarget(self, action: #selector(actionSignInButton), for: .touchUpInside)
        
    }
    
    @objc func actionSignInButton() {
        viewModel.login()
    }
    
//    @objc func actionSignInButton() {
//        let authProvider = ASAuthorizationAppleIDProvider()
//        let request = authProvider.createRequest()
//        request.requestedScopes = []
//        
//        let controller = ASAuthorizationController(authorizationRequests: [request])
//        controller.delegate = self
//        controller.presentationContextProvider = self
//        controller.performRequests()
//    }
}

extension AuthViewController: AuthViewModelDelegate {
    func didRequestOnboarding() {
        coordinator?.navigateToOnboarding()
    }
}

//extension AuthViewController: ASAuthorizationControllerDelegate {
//    func authorizationController(
//        controller: ASAuthorizationController,
//        didCompleteWithAuthorization authorization: ASAuthorization
//    ) {
//        switch authorization.credential {
//        case let appleIDCredential as ASAuthorizationAppleIDCredential:
//            print("Apple ID: \(appleIDCredential.identityToken)")
//        case let passwordCredential as ASPasswordCredential:
//            print("Password credential: \(passwordCredential.user)")
//        default:
//            print(authorization.credential)
//            break
//        }
//    }
//    
//    func authorizationController(
//        controller: ASAuthorizationController,
//        didCompleteWithError error: Error
//    ) {
//        print("❌ Erro ao autenticar:", error.localizedDescription)
//    }
//}
//
//extension AuthViewController: ASAuthorizationControllerPresentationContextProviding {
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        self.view.window!
//    }
//}
