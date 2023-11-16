//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 16/11/23.
//

import SwiftUI


///View que mostra um texto de footnote do nosso pacote
public struct FootnoteView: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe o peso que deseja mostrar como parâmetro
    public var weight: Weight
    /// Variável que recebe se o texto vai ser em itálico ou não
    public var italic: Bool
    
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - weight: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - italic: Variável que recebe se o texto vai ser em itálico ou não
    public init(text: String, weight: Weight, italic: Bool){
        self.text = text
        self.weight = weight
        self.italic = italic
    }
    
    ///  Corpo da View
    public var body: some View {
        Text(text)
            .font(.custom(weight == .regularWeight && italic == false ? "Cygre-Regular" : weight == .regularWeight && italic == true ? "Cygre-RegularIt" : weight == .boldWeight && italic == false ? "Cygre-Bold" : "Cygre-BoldIt", size: 13))
    }
}


#Preview {
    FootnoteView(text: "Footnote",weight:.boldWeight, italic: true)
}
