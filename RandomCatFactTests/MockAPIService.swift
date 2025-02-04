//
//  MockAPIService.swift
//  RandomCatFactTests
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import Foundation
@testable import RandomCatFact

// Mock API Service
class MockAPIService: CatServiceProtocol {
    
    var shouldFail: Bool = false
    
    func fetchCatFact() async throws -> String {
        if shouldFail { throw CatServiceError.requestFailed }
        return PreviewConstant.catFact
    }
    
    func fetchCatImage() async throws -> String {
        if shouldFail { throw CatServiceError.requestFailed }
        return PreviewConstant.catImageURL
    }
}
