//
//  BigCard.swift
//  card
//
//  Created by Jennifer Pires and Laura Santos on 14/11/23.
//

import SwiftUI

/// Componente informativo que contém imagem , texto e botão.
public struct BigCard: View {
    
    /// Variável responsável pelo título do card
    @State var cardTitle: String
    /// Variável responsável pelo descrição do card
    @State var cardDesc: String
    /// Variável responsável pelo nome da imagem a ser inserida no card
    @State var cardImage: String
    /// Variável responsável pela descrição da imagem inserida no card
    @State var cardDescImage: String
    
    public var body: some View {
        VStack (alignment: . leading){
                Image("\(cardImage)")
                .resizable()
                .scaledToFill()
                .frame(width: 310, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .accessibilityLabel("\(cardDescImage)")
            
            VStack (alignment: .leading){
                Text("\(cardTitle)")
                    .accessibilityLabel("\(cardTitle)")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color("academyWhite"))
                    .lineLimit(1)
                    .padding(.vertical, 2)
                //
                Text("\(cardDesc)")
                    .accessibilityLabel("\(cardDesc)")
                    .font(.body)
                    .foregroundStyle(Color("academyWhite"))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 10)
            }
            
            Button{
            } label: {
                /// Adicionar botão aqui
                Rectangle()
                    .frame(width: 310, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color("academyAssetDarkMode"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}

#Preview {
    BigCard(cardTitle: "Heading", cardDesc: "This is a short description about \nthe card", cardImage: "Image", cardDescImage: "Descrição sobre a imagem colocada no card")
}
