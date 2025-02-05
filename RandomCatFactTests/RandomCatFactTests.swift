//
//  RandomCatFactTests.swift
//  RandomCatFactTests
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import XCTest

@testable import RandomCatFact

final class RandomCatFactTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor
    func testFetchCatData_Success() async {
        //Arrange
        let mockService = MockAPIService()
        let viewModel = CatViewModel(catService: mockService)
        
        //Act
        await viewModel.fetchCatData()
        
        //Assert
        XCTAssertEqual(viewModel.catFact, PreviewConstant.catFact)
        XCTAssertEqual(viewModel.catImageURL, PreviewConstant.catImageURL)
        XCTAssertNil(viewModel.errorMessage)
    }
    
    @MainActor
    func testFetchCatData_Failure() async {
        // Arrange
        let mockService = MockAPIService()
        mockService.shouldFail = true
        let viewModel = CatViewModel(catService: mockService)
        
        // Act
        await viewModel.fetchCatData()
        
        // Assert
        XCTAssertEqual(viewModel.errorMessage, CatServiceError.requestFailed.localizedDescription)
    }
    
}
