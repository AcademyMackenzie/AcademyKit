//
//  MiniCard.swift
//  card
//
//  Created by Jennifer Pires and Laura Santos on 14/11/23.
//

import SwiftUI

/// Componente informativo que abre um menu.
public struct MiniCard: View {
    /// Variável responsável pelo título do card
    @State var cardTitle: String
    /// Variável responsável pelo descrição do card
    @State var cardDesc: String
    /// Variável responsável pelo nome da imagem a ser inserida no card
    @State var cardImage: String
    /// Variável responsável pela descrição da imagem inserida no card
    @State var cardDescImage: String
    
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
                Text("\(cardTitle)")
                    .accessibilityLabel("\(cardTitle)")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Color("academyWhite"))
                    .lineLimit(1)
                    .padding(.vertical, 2)
                
                Text("\(cardDesc)")
                    .accessibilityLabel("\(cardDesc)")
                    .font(.subheadline)
                    .foregroundStyle(Color("academyWhite"))
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
        .background(Color("academyAssetDarkMode"))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}
#Preview {
    MiniCard(cardTitle: "Heading", cardDesc: "This is a short description about \nthe card", cardImage: "Image", cardDescImage: "Descrição sobre a imagem colocada no card")
}
