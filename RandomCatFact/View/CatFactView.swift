//
//  ContentView.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import SwiftUI
import TipKit

// MARK: - View
struct CatFactView: View {
    @StateObject private var viewModel: CatViewModel = CatViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        CatImageView(imageURL: viewModel.catImageURL)
                            .frame(maxWidth: geometry.size.width * 0.9, maxHeight: geometry.size.height * 0.6)
                        FactView(fact: viewModel.catFact)
                            .frame(maxWidth: geometry.size.width * 0.9)
                        
                        if let errorMessage = viewModel.errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                    .frame(width: geometry.size.width)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    Task {
                        await viewModel.fetchCatData()
                    }
                }
            }
            .task {
                await viewModel.fetchCatData()
            }
            .padding()
            .navigationTitle("Cat Fact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    CatFactView()
}
