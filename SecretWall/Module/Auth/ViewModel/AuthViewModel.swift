//
//  AuthViewModel.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

class AuthViewModel {
    weak var delegate: AuthViewModelDelegate?
    
    func login() {
        delegate?.didRequestOnboarding()
    }
}
