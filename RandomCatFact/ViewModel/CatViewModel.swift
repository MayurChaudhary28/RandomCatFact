//
//  CatViewModel.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import Foundation
import TipKit

// MARK: - ViewModel
@MainActor
class CatViewModel: ObservableObject {
    
    //Properties
    @Published var catImageURL: String = ""
    @Published var catFact: String = ""
    @Published var errorMessage: String?
    
    private var isTipShown = false
    private var catService: CatServiceProtocol
    
    // Init Method
    init(catService: CatServiceProtocol = APIService()) {
        self.catService = catService
    }
    
    func fetchCatData() async {
        await self.fetchCatFactData()
    }
    
    private func fetchCatFactData() async {
        errorMessage = nil  // Reset errors before fetching
        do {
            async let fact = catService.fetchCatFact()
            async let image = catService.fetchCatImage()
            catFact = try await fact
            catImageURL = try await image
            if !isTipShown {
                isTipShown = true
                setUpTips()
            }
        } catch let error as CatServiceError {
            errorMessage = error.localizedDescription
            clearProperties()
        } catch {
            errorMessage = CatServiceError.unknownError.localizedDescription
            clearProperties()
        }
    }
    
    private func clearProperties() {
        catFact = ""
        catImageURL = ""
    }
    
    // SetUp Tips Method
    func setUpTips() {
        do {
            try Tips.resetDatastore()
            try Tips.configure([
                .displayFrequency(.immediate)
            ])
        } catch {
            print("Error initializing TipKit \(error.localizedDescription)")
        }
    }
}
