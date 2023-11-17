//
//  LittleCard.swift
//  card
//
//  Created by Jennifer Pires and Laura Santos on 14/11/23.
//

import SwiftUI

/// Componente informativo que contém Imagem e texto.
public struct LittleCard: View {
    ///Esta variável contém informações sobre o modo claro e o modo escuro do dispositivo
    @Environment(\.colorScheme) var colorScheme
    
    
    /// Variável responsável pelo título do card
    var cardTitle: String
    /// Variável responsável pelo descrição do card
    var cardDesc: String
    /// Variável responsável pelo nome da imagem a ser inserida no card
    var cardImage: String
    /// Variável responsável pela descrição da imagem inserida no card
    var cardDescImage: String
    
    
    
    public init(cardTitle: String, cardDesc: String, cardImage: String, cardDescImage: String) {
        self.cardTitle = cardTitle
        self.cardDesc = cardDesc
        self.cardImage = cardImage
        self.cardDescImage = cardDescImage
    }
    
    public  var body: some View {
        VStack(alignment: .leading) {
            Image("\(cardImage)")
                .resizable()
                .scaledToFill()
                .frame(width: 310, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .accessibilityLabel("\(cardDescImage)")
            
            VStack(alignment: .leading) {
                TitleView(text: cardTitle, weight: .boldWeight, title: .title1)
                    .foregroundStyle(Color.academyAccentDarkMode)
                    .colorInvert()
                    .lineLimit(1)
                    .padding(.vertical, 2)
                BodyView(text: cardDesc, weight: .regularWeight, italic: false, bodyType: .body)
                    .foregroundStyle(Color.academyAccentDarkMode)
                    .colorInvert()
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
            }
            .padding(.trailing, 60)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(colorScheme == .light ? Color.academyAccentDarkMode : Color.academyWhite)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    LittleCard(cardTitle: "Heading", cardDesc: "This is a short description about \nthe card", cardImage: "Image", cardDescImage: "Desc da Image")
}
