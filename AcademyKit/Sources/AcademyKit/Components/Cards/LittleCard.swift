//
//  LittleCard.swift
//  card
//
//  Created by Jennifer Pires and Laura Santos on 14/11/23.
//

import SwiftUI

/// Componente informativo que contém Imagem e texto.
public struct MediumCard: View {
    
    /// Variável responsável pelo título do card
    @State var cardTitle: String
    /// Variável responsável pelo descrição do card
    @State var cardDesc: String
    /// Variável responsável pelo nome da imagem a ser inserida no card
    @State var cardImage: String
    /// Variável responsável pela descrição da imagem inserida no card
    @State var cardDescImage: String
    
    public  var body: some View {
        VStack(alignment: .leading) {
            Image("\(cardImage)")
                .resizable()
                .scaledToFill()
                .frame(width: 310, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .accessibilityLabel("\(cardDescImage)")
            
            VStack(alignment: .leading) {
                Text("\(cardTitle)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color("academyWhite"))
                    .lineLimit(1)
                    .padding(.vertical, 2)
                
                Text("\(cardDesc)")
                    .font(.body)
                    .foregroundStyle(Color("academyWhite"))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
            }
            .padding(.trailing, 60)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color("academyAssetDarkMode"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    MediumCard(cardTitle: "Heading", cardDesc: "This is a short description about \nthe card", cardImage: "Image", cardDescImage: "Desc da Image")
}
