//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Luz on 16/11/23.
//

import SwiftUI

/// View que representa a customização de uma Label
public struct SegmentLabel: View {
    
    
    /// Variável que determina o título de uma Label
    public let title: String
    
    /// Variável que determina o tamanho de uma Label
    public let width: CGFloat
    
    /// Variável que determina a cor do título da label
    public let textColor: Color
    
    
    ///Variável que recebe o estado de seleção da label.
    @Binding public var isSelected: String
    
    
    /// Inicializador que cria a Label do SegmentedControl
    /// - Parameters:
    ///   - title: Variável que determina o título de uma Label
    ///   - width: Variável que determina o tamanho de uma Label
    ///   - textColor: Variável que determina a cor do título da label
    ///   - isSelected: Variável que recebe o estado de seleção da label.
    public init(title: String, width: CGFloat, textColor: Color, isSelected: Binding<String>) {
        self.title = title
        self.width = width
        self.textColor = textColor
        self._isSelected = isSelected
    }
    
    /// Corpo da View que contém o componente do texto da Label
    public var body: some View {
        ZStack {
            Text(title)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: false)
                .foregroundColor(textColor)
                .frame(width: width)
                .contentShape(Rectangle())
                .font(.custom(isSelected == title ? "Cygre-Regular" : "Cygre-Bold", size: 13))
                .accessibilityLabel("opção" + title + "selecionada.")
        }
        
    }
    
}

#Preview {
    SegmentLabel(title: "One", width: 100, textColor: .academyBlack, isSelected: .constant("One"))
}
