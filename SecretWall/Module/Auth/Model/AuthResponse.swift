//
//  AuthResponse.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

public class AuthResponse: Decodable {
    public let accessToken: String
    public var userID: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case userID = "id"
    }
}
