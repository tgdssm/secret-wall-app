//
//  AuthRequest.swift
//  SecretWall
//
//  Created by Thalisson Melo on 04/04/25.
//

class AuthRequest: Encodable {
    public let identityToken: String
    
    enum CodingKeys: String, CodingKey {
        case identityToken = "identity_token"
    }
    
    init(identityToken: String) {
        self.identityToken = identityToken
    }
}

