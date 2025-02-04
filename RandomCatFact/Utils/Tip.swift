//
//  Tip.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 04/02/25.
//

import Foundation
import TipKit

// MARK: - Tip Configuration
struct CatTip: Tip {
    var title: Text {
        Text(AppConstant.tipTitle)
    }
    
    var message: Text? {
        Text(AppConstant.tipMessage)
    }
    
    var image: Image? {
        Image(systemName: AppConstant.tipIconName)
    }
}
 
// MARK: - Custom Tip View Style
struct CatTipViewStyle: TipViewStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: TipViewStyle.Configuration) -> some View {
        VStack {
            HStack(alignment: .top) {
                configuration.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45.0, height: 45.0)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                VStack(alignment: .leading, spacing: 5.0) {
                    configuration.title?
                        .font(.headline)
                    configuration.message?
                        .font(.caption2)
                }
                
                Button(action: { configuration.tip.invalidate(reason: .tipClosed) }) {
                    Image(systemName: "xmark").scaledToFit()
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
            }
        }
        .padding()
    }
}

