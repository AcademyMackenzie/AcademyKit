//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 16/11/23.
//

import SwiftUI

/// Enum que classifica o tipo de corpo
/// - Casos:
///   - body: Corpo de tamanho 17
///   - callout: Corpo de tamanho 16
///   - subheadline: Corpo de tamanho 15
///   - footnote: Corpo de tamanho 13
///   - caption1: Corpo de tamanho 12
///   - caption2: Corpo de tamanho 11
public enum bodyEnum{
    case body
    case callout
    case subheadline
    case footnote
    case caption1
    case caption2
}


///View que mostra um texto de corpo do nosso pacote
public struct BodyView: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe o peso que deseja mostrar como parâmetro
    public var weight: weightEnum
    /// Variável que recebe se o texto vai ser em itálico ou não
    public var italic: Bool
    /// Variável que recebe o tipo de corpo que o texto vai ter
    public var bodyType: bodyEnum
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - weight: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - italic: Variável que recebe se o texto vai ser em itálico ou não
    ///   - bodyType: Variável que recebe o tipo de corpo que o texto vai ter
    public init(text: String, weight: weightEnum, italic: Bool, bodyType: bodyEnum){
        self.text = text
        self.weight = weight
        self.italic = italic
        self.bodyType = bodyType
    }
    
    /// Corpo da View
    public var body: some View {
        
        Text(text)
            .font(.custom(weight == .regularWeight && italic == false ? "Cygre-Regular" : weight == .regularWeight && italic == true ? "Cygre-RegularIt" : weight == .boldWeight && italic == false ? "Cygre-Bold" : "Cygre-BoldIt", size: bodyType == .body ? 17 : bodyType == .callout ? 16 : bodyType == .subheadline ? 15 : bodyType == .footnote ? 13 : bodyType == .caption1 ? 12 : 12))
    }
}


#Preview {
    BodyView(text: "Body", weight: .boldWeight, italic: false, bodyType: .caption2)
}
