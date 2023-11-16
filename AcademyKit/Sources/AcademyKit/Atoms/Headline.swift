//
//  SwiftUIView.swift
//
//
//  Created by Gabriel Vicentin Negro on 16/11/23.
//

import SwiftUI


///View que mostra um texto de headline do nosso pacote
public struct Headline: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe se o texto vai ser em italico ou não como parâmetro
    public var italic: Bool
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - italic: Variável que recebe se o texto vai ser em italico ou não como parâmetro
    public init(text: String, italic: Bool){
        self.text = text
        self.italic = italic
    }
    
    ///  Corpo da View
    public var body: some View {
        Text(text)
            .font(.custom(italic == false ? "Cygre-Bold" : "Cygre-BoldIt", size: 17))
    }
}


#Preview {
    Headline(text: "Headline",italic: false)
}
