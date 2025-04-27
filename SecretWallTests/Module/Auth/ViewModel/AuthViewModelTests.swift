//
//  AuthViewModelTests.swift
//  SecretWall
//
//  Created by Thalisson Melo on 06/04/25.
//

import XCTest
@testable import SecretWall

final class MockAuthService: AuthServiceProtocol {
    var shouldSucceed = true
    var responseToReturn = AuthResponse(accessToken: "accessToken", userID: "userID")
    var errorToReturn = NSError(domain: "", code: 1, userInfo: [NSLocalizedDescriptionKey : "error"])
    
    func loginWithApple(authRequest: SecretWall.AuthRequest) async throws -> SecretWall.AuthResponse {
        if shouldSucceed {
            return responseToReturn
        } else {
            throw errorToReturn
        }
    }
}

final class MockAuthViewModelDelegate: AuthViewModelDelegate {
    var didNavigateToHomeCalled = false
    var didShowErrorCalled = false
    var didStartLoadingCalled = false
    var didStopLoadingCalled = false
    
    var onStopLoading: (() -> Void)?
    var onNavigateToHome: (() -> Void)?
    
    func navigateToHome() {
        didNavigateToHomeCalled = true
        onNavigateToHome?()
    }
    
    func startLoading() { didStartLoadingCalled = true }
    
    func stopLoading() {
        didStopLoadingCalled = true
        onStopLoading?()
    }
    
    func showError() { didShowErrorCalled = true }
    
    
}

final class AuthViewModelTests: XCTestCase {
    var viewModel: AuthViewModel!
    let mockService = MockAuthService()
    let mockDelegate = MockAuthViewModelDelegate()
    
    override func setUp() {
        super.setUp()
        viewModel = AuthViewModel(authService: mockService)
        viewModel.delegate = mockDelegate
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_loginWithApple_succeeds() {
        let expectation = self.expectation(description: "Finished and navigated")
        mockDelegate.onNavigateToHome = {
            expectation.fulfill()
        }
        
        viewModel.loginWithApple(identityToken: "identityToken")
        
        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(mockDelegate.didStartLoadingCalled)
        XCTAssertTrue(mockDelegate.didStopLoadingCalled)
        XCTAssertTrue(mockDelegate.didNavigateToHomeCalled)
        XCTAssertFalse(mockDelegate.didShowErrorCalled)
    }
    
    func test_loginWithApple_failure() {
        let expectation = self.expectation(description: "Finished and showed error")
        
        mockDelegate.onStopLoading = {
            expectation.fulfill()
        }
        
        mockService.shouldSucceed = false
        viewModel.loginWithApple(identityToken: "identityToken")
        
        wait(for: [expectation], timeout: 1)

        XCTAssertTrue(mockDelegate.didStartLoadingCalled)
        XCTAssertTrue(mockDelegate.didStopLoadingCalled)
        XCTAssertTrue(mockDelegate.didShowErrorCalled)
        XCTAssertFalse(mockDelegate.didNavigateToHomeCalled)
    }
}
