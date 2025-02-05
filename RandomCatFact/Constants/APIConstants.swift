//
//  APIConstants.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import Foundation

// MARK: - API URLs
struct APIConstants {
    static let catFactURL = "https://meowfacts.herokuapp.com/"
    static let catImageURL = "https://api.thecatapi.com/v1/images/search"
}

// MARK: - App Constants
struct AppConstant {
    static let appTitle = "Cat Fact"
    static let tipTitle = "Did you know?"
    static let tipMessage = "Tap anywhere on the screen to see a new cat image and fact!"
    static let tipIconName = "cat.circle"
    static let errorTitle = "Oops!"
    static let errorMessage = "Something went wrong"
}

// MARK: - Preview Constant
struct PreviewConstant {
    static let catImageURL = "https://cdn2.thecatapi.com/images/a79.jpg"
    static let catFact = "A cat has been mayor of Talkeetna, Alaska, for 15 years. His name is Stubbs."
}

// MARK: - API Error Enum
enum CatServiceError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please try again later."
        case .requestFailed:
            return "Network request failed. Please check your connection."
        case .decodingFailed:
            return "Failed to decode data from the server."
        case .unknownError:
            return "Something went wrong. Please try again."
        }
    }
}

