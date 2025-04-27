//
//  AuthService.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

import Foundation

protocol AuthServiceProtocol {
    func loginWithApple(authRequest: AuthRequest) async throws -> AuthResponse
}

class AuthServiceImpl: AuthServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func loginWithApple(authRequest: AuthRequest)  async throws -> AuthResponse {
        var request = URLRequest(url: Url.loginWithApple)
        request.httpMethod = HttpMethods.post
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try JSONEncoder().encode(authRequest)
        request.httpBody = jsonData
        
        let (data, urlResponse) = try await session.data(for: request)
        
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            let response = try JSONDecoder().decode(AuthResponse.self, from: data)
            return response
        default:
            let errorResponse = (try? JSONDecoder().decode(ErrorResponse.self, from: data))?.error ?? "Unknown error"
            throw NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey : errorResponse])
        }
    }
}
