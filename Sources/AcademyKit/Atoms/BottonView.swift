//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 16/11/23.
//

import SwiftUI

/// Enum que classifica o tipo de botton
/// - Casos:
///   - medium:  Botton de tamanho 18
///   - small: Botton de tamanho 14
public enum bottonEnum{
    case medium
    case small
}

///View que mostra um texto de corpo do nosso pacote
public struct BottonView: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe o peso que deseja mostrar como parâmetro
    public var weight: weightEnum
    /// Variável que recebe o tipo do botton
    public var bottonType: bottonEnum
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - weight: Variável que recebe o peso que deseja mostrar como parâmetro
    ///   - bottonType: Variável que recebe o tipo do botton como parâmetro
    public init(text: String, weight: weightEnum, italic: Bool, bottonType: bottonEnum){
        self.text = text
        self.weight = weight
        self.bottonType = bottonType
    }
    
    ///  Corpo da View
    public var body: some View {
        Text(text)
            .font(.custom(weight == .regularWeight ? "Cygre-Regular" : "Cygre-Bold", size: bottonType == .medium ? 18 : 14))
    }
}


#Preview {
    BottonView(text: "Body", weight: .regularWeight, italic: false, bottonType: .small)
}
