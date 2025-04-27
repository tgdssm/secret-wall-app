//
//  AuthResponse.swift
//  SecretWall
//
//  Created by Thalisson Melo on 26/03/25.
//

public class AuthResponse: Decodable, Encodable {
    public let accessToken: String
    public var userID: String
    
    init(accessToken: String, userID: String) {
        self.accessToken = accessToken
        self.userID = userID
    }
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case userID = "id"
    }
}
