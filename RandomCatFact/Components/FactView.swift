//
//  CatFactView.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import SwiftUI

struct FactView: View {
    let fact: String
    
    var body: some View {
        if fact.isEmpty {
            EmptyView()
        } else {
            Text(fact)
                .font(.subheadline.weight(.medium))
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .popoverTip(CatTip())
                .tipViewStyle(CatTipViewStyle())
        }
    }
}

#Preview {
    FactView(fact: PreviewConstant.catFact)
}
