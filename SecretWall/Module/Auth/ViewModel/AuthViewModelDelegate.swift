//
//  AuthViewModelDelegate.swift
//  SecretWall
//
//  Created by Thalisson Melo on 29/03/25.
//

protocol AuthViewModelDelegate: AnyObject {
    func navigateToHome()
    func startLoading()
    func stopLoading()
    func showError()
}
