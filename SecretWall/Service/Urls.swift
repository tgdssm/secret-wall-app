//
//  Urls.swift
//  SecretWall
//
//  Created by Thalisson Melo on 04/04/25.
//

import Foundation

struct Url {
    private static var baseUrl: String {
        guard let baseUrl = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            fatalError(#function + ": Missing required info.plist key 'BASE_URL'")
        }
        return baseUrl
    }
}

extension Url {
    public static var loginWithApple: URL {
        URL(string: "\(baseUrl)/auth/apple")!
    }
}
