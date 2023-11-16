//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 16/11/23.
//

import SwiftUI


///View que mostra um texto de título 2 do nosso pacote
public struct Title2View: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var weight: Weight
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - weight: Variável que recebe o texto que deseja mostrar como parâmetro
    public init(text: String, weight: Weight){
        self.text = text
        self.weight = weight
    }
    
    ///  Corpo da View
    public var body: some View {
        Text(text)
            .font(.custom(weight == .regularWeight ? "Cygre-Regular" : "Cygre-Bold", size: 22))
    }
}


#Preview {
    Title2View(text: "Title2",weight: .boldWeight)
}
