//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Luz on 16/11/23.
//

import SwiftUI

/// View que representa a customização de uma Label
struct SegmentLabel: View {
    
    
    /// Variável que determina o título de uma Label
    let title: String
    
    /// Variável que determina o tamanho de uma Label
    let width: CGFloat
    
    /// Variável que determina a cor do título da label
    let textColour: Color
    
    
    ///Variável que recebe o estado de seleção da label.
    @Binding var isSelected: String
    
    /// Corpo da View que contém o componente do texto da Label
    var body: some View {
        ZStack {
            Text(title)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: false)
                .foregroundColor(textColour)
                .frame(width: width)
                .contentShape(Rectangle())
                .font(.custom(isSelected == title ? "Cygre-Regular" : "Cygre-Bold", size: 13))
                .accessibilityLabel("opção" + title + "selecionada.")
        }
        
    }
}

#Preview {
    SegmentLabel(title: "One", width: 100, textColour: .academyBlack, isSelected: .constant("One"))
}
