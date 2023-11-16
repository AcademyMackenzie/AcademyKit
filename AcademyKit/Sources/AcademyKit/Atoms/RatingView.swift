//
//  SwiftUIView.swift
//
//
//  Created by Gabriel Sabaini on 14/11/23.
//

import SwiftUI

public struct RatingView: View {
    
    @Binding var rating: Int?

    
    private func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    public var body: some View {
        HStack {
            ForEach(1...5, id: \.self) {
                index in
                Image(systemName: self.starType(index: index))
                    .foregroundStyle(Color.academyPurple)
                    .accessibilityRemoveTraits(.isImage)
                    .onTapGesture {
                        self.rating = index
                    }
                    .accessibilityLabel(rating == nil ? "estrela \(index), 0 de 5 estrelas" : "estrela \(index), \(rating!) de 5 estrelas")
            }
        }

    }
}

#Preview {
    RatingView(rating: .constant(4))
}
