//
//  CatImageView.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import SwiftUI

struct CatImageView: View {
    let imageURL: URL?
    
    var body: some View {
        if let url = imageURL {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "\(AppConstant.tipIconName).fill")
                        .iconModifier()
                case .success(let image):
                    image.imageModifier()
                case .failure(_):
                    Image(systemName: "\(AppConstant.tipIconName).fill")
                        .iconModifier()
                @unknown default:
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    CatImageView(imageURL: URL(string: PreviewConstant.catImageURL))
}

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .cornerRadius(15)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .scaledToFit()
            .frame(width: 100,height: 100)
            .foregroundColor(.gray)
    }
}
