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
public enum weightEnum{
    case boldWeight
    case regularWeight
}
/// Enum que classifica o tipo do título
/// - Casos:
///   - largeTitle: O maior título possível
///   - title1: O segundo maior título
///   - title2: O terceito maior título
///   - title3: O quarto mais título
public enum titleEnum{
    case largeTitle
    case title1
    case title2
    case title3
}

///View que mostra um texto de título grande do nosso pacote
public struct TitleView: View {
    
    /// Variável que recebe o texto que deseja mostrar como parâmetro
    public var text: String
    /// Variável que recebe o peso que deseja mostrar como parâmetro
    public var weight: weightEnum
    /// Variável que recebe o tipo do título do texto
    public var title: titleEnum
    
    /// Inicializador da View
    /// - Parameters:
    ///   - text: Variável que recebe o texto que deseja mostrar como parâmetro
    ///   - weight: Variável que recebe o peso que deseja mostrar como parâmetro
    ///   - title: Variável que recebe o tipo do título do texto
    public init(text: String, weight: weightEnum, title: titleEnum){
        self.text = text
        self.weight = weight
        self.title = title
    }
    
    ///  Corpo da View
    public var body: some View {
        Text(text)
            .font(.custom(weight == .regularWeight ? "Cygre-Regular" : "Cygre-Bold", size: title == .largeTitle ? 34 : title == .title1 ? 28 : title == .title2 ? 22 : 30 ))
    }
}

#Preview {
    TitleView(text: "LargeTitle", weight: .regularWeight, title: .largeTitle)
}
