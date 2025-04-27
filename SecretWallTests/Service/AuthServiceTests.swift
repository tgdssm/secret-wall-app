//
//  AuthServiceTests.swift
//  SecretWall
//
//  Created by Thalisson Melo on 06/04/25.
//
import XCTest
@testable import SecretWall

final class AuthServiceTests: XCTestCase {
    var service: AuthServiceProtocol!
    
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        
        service = AuthServiceImpl(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
        service = nil
        MockURLProtocol.error = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func test_loginWithApple_success() async throws {
        let expectedToken = "teste_token"
        let responseData = AuthResponse(accessToken: expectedToken, userID: "userID")
        MockURLProtocol.responseStatusCode = 200
        MockURLProtocol.stubResponseData = try JSONEncoder().encode(responseData)
        
        let response = try await service.loginWithApple(authRequest: AuthRequest(identityToken: "identity_token"))
        
        XCTAssertEqual(response.accessToken, expectedToken)
    }
    
    func test_loginWithApple_failure() async throws {
        let error = ErrorResponse(error: "error")
        MockURLProtocol.responseStatusCode = 401
        MockURLProtocol.stubResponseData = try JSONEncoder().encode(error)
        
        do {
            _ = try await service.loginWithApple(authRequest: AuthRequest(identityToken: "identity_token"))
            XCTFail(#function + " should throw")
        } catch {
            XCTAssertTrue(error.localizedDescription.contains("error"))
        }
        
    }
}
