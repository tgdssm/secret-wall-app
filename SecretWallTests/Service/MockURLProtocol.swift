//
//  MockURLProtocol.swift
//  SecretWall
//
//  Created by Thalisson Melo on 11/04/25.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var responseStatusCode: Int = 200
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: MockURLProtocol.responseStatusCode,
            httpVersion: nil,
            headerFields: nil,
        )!
        
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowed)
        
        if let data = MockURLProtocol.stubResponseData {
            client?.urlProtocol(self, didLoad: data)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
