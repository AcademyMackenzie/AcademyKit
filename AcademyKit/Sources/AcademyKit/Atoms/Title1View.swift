//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 16/11/23.
//

import SwiftUI


///View que mostra um texto de título de tamanho 1 do nosso pacote
public struct Title1View: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe o peso que deseja mostrar como parâmetro
    public var weight: Weight
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - weight: Variável que recebe o peso que deseja mostrar como parâmetro
    public init(text: String, weight: Weight){
        self.text = text
        self.weight = weight
    }
    
    ///  Corpo da View
    public var body: some View {
        Text(text)
            .font(.custom(weight == .regularWeight ? "Cygre-Regular" : "Cygre-Bold", size: 28))
    }
}


#Preview {
    Title1View(text: "Title1",weight: .boldWeight)
}
