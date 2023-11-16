//
//  SwiftUIView.swift
//
//
//  Created by Gabriel Sabaini on 14/11/23.
//

import SwiftUI

///View responsável pelo átomo Rating Indicator ``RatingView``
///
/// - Parameters:
///      - rating: Número de estrelas
public struct RatingView: View {
    
    ///Número de estrelas usado para renderizar as estrelas, podendo elas serem cheias ou vazias
    @Binding public var rating: Int? //para chamar a Rating View é necessário criar uma variável de State com um tipo de Int opcional em que se passa o estado na variável rating e é possível clicar nas estrelas

    ///Função responsável por transformar o número Int por estrelas cheias
    public func starType(index: Int) -> String {
        
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    ///Corpo do componente do Rating Indicator
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
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                    let starWidth = UIScreen.main.bounds.width / 10
                                    let rating = min(max(1, (value.location.x + starWidth / 2) / starWidth), 5)
                                    self.rating = Int(rating)
                            }
                    )
            }
        }

    }
}

#Preview {
    RatingView(rating: .constant(4))
}
