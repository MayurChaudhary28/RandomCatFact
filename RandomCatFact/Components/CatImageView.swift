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
            AsyncImage(url: url) { image in
                image.resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    CatImageView(imageURL: URL(string: PreviewConstant.catImageURL))
}
