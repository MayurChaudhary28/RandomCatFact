//
//  ApiService.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import Foundation

// MARK: - API Service
protocol CatServiceProtocol {
    func fetchCatFact() async throws -> String
    func fetchCatImage() async throws -> String
}

class APIService: CatServiceProtocol {
    
    func fetchCatFact() async throws -> String {
        let factResponse: CatFact = try await fetchData(from: APIConstants.catFactURL)
        return factResponse.data.first ?? ""
    }
    
    func fetchCatImage() async throws -> String {
        let imageResponse: [CatImage] = try await fetchData(from: APIConstants.catImageURL)
        return imageResponse.first?.url ?? ""
    }
    
    private func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw CatServiceError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch is URLError {
            throw CatServiceError.requestFailed
        } catch is DecodingError {
            throw CatServiceError.decodingFailed
        } catch {
            throw CatServiceError.unknownError
        }
    }
}
