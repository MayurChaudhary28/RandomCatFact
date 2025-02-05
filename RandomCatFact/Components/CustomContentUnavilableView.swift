//
//  CustomContentUnavilableView.swift
//  RandomCatFact
//
//  Created by Mayur Chaudhary on 05/02/25.
//

import SwiftUI

struct CustomContentUnavilableView: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)
            
            Text(title)
                .font(.title)
        } description: {
            Text(description)
        }
        .foregroundStyle(.gray)
    }
}

#Preview {
    CustomContentUnavilableView(icon: AppConstant.tipIconName, title: AppConstant.errorTitle, description: AppConstant.errorMessage)
}
