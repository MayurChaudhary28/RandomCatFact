//
//  CatModel.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import Foundation

// MARK: - Model
struct CatImage: Decodable {
    let url: String
}

struct CatFact: Decodable {
    let data: [String]
}
