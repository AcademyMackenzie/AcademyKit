//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 14/11/23.
//
import SwiftUI


/// Enum que classifica o peso do título, se será regular ou negrito
/// - Casos:
///   - boldWeight: Peso em negrito do texto
///   - regularWeight: Peso regular do texto
public enum Weight{
    case boldWeight
    case regularWeight
}

///View que mostra um texto de título grande do nosso pacote
public struct LargeTitleView: View {
    
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
            .font(.custom(weight == .regularWeight ? "Cygre-Regular" : "Cygre-Bold", size: 34))
    }
}

#Preview {
    LargeTitleView(text: "LargeTitle", weight: .regularWeight)
}
