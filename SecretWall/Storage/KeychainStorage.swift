//
//  KeychainStorage.swift
//  SecretWall
//
//  Created by Thalisson Melo on 04/04/25.
//

import Foundation

class KeychainStorage {
    public static func saveAccessToken(_ token: String, service: String, account: String) throws {
        let query = [
            kSecValueData: Data(token.utf8),
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary
        
        var status = SecItemAdd(query, nil)
        
        if status == errSecDuplicateItem {
            let query = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: service,
                kSecAttrAccount: account,
            ] as CFDictionary
            
            let attributesToUpdate: CFDictionary = [
                kSecValueData: Data(token.utf8),
            ] as CFDictionary
            
            status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
        }
        
        if status != errSecSuccess {
            let message = SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error"
            throw NSError(domain: "KeychainStorage", code: Int(status), userInfo: [NSLocalizedDescriptionKey: message])
        }
        
        return
    }
    
    public static func readAccessToken(service: String, account: String) throws -> String? {
        let query: CFDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true,
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        
        switch status {
        case errSecItemNotFound:
            return nil
        case errSecSuccess:
            return String(data: result as! Data, encoding: .utf8)
        default :
            let message = SecCopyErrorMessageString(status, nil) as String? ?? "Unknown error"
            throw NSError(domain: "KeychainStorage", code: Int(status), userInfo: [NSLocalizedDescriptionKey: message])
        }
    }
}
