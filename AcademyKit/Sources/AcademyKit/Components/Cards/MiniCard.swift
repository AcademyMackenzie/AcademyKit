//
//  MiniCard.swift
//  card
//
//  Created by Jennifer Pires and Laura Santos on 14/11/23.
//

import SwiftUI

/// Componente informativo que abre um menu.
public struct MiniCard: View {
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
    
    public var body: some View {
        HStack(alignment:.center){
            Image("\(cardImage)")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60,height: 60)
                .padding(.trailing, 5)
                .accessibilityLabel("\(cardDescImage)")
            
            VStack(alignment: .leading) {
                Headline(text: cardTitle, italic: false)
                    .accessibilityLabel("\(cardTitle)")
                    .foregroundStyle(Color.academyAccentDarkMode)
                    .colorInvert()
                    .lineLimit(1)
                    .padding(.vertical, 2)
                
                BodyView(text: cardDesc, weight: .regularWeight, italic: false, bodyType: .subheadline)
                    .accessibilityLabel("\(cardDesc)")
                    .font(.subheadline)
                    .foregroundStyle(Color.academyAccentDarkMode)
                    .colorInvert()
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            .padding(.trailing)

            
            Button {
            } label: {
                Image(systemName:"ellipsis")
                    .foregroundColor(.academyWhite)
                    .rotationEffect(.degrees(90))
                    .padding(.trailing, 5)
            }
        }
        .padding(.vertical, 13)
        .padding(.horizontal, 13)
        .background(colorScheme == .light ? Color.academyAccentDarkMode : Color.academyWhite)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}
#Preview {
    MiniCard(cardTitle: "Heading", cardDesc: "This is a short description about \nthe card", cardImage: "Image", cardDescImage: "Descrição sobre a imagem colocada no card")
}
