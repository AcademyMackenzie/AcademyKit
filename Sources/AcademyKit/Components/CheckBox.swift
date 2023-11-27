//
//  SwiftUIView.swift
//  
//
//  Created by Raphael Iniesta Reis on 24/11/23.
//

import SwiftUI

/// Uma caixa de seleção para valores booleanos
///
///     -Parameters:
///         - text: String que será exibida ao lado da caixa de seleção
///         - isChecked: Booleano de retorno para verificação
public struct CheckBox: View {
    @State public var text: String
    @State public var isChecked: Bool
    
    /// Inicializador dos termos
    ///
    ///  - Parameters:
    ///     - text: inicializa ___text___
    ///     - isChecked: inicializa ___isChecked___
    init(_ text: String, isChecked: Bool) {
        self.text = text
        self.isChecked = isChecked
    }
    
    public var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 19, height: 19)
                .foregroundStyle(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 13, height: 13)
                        .foregroundStyle(isChecked ? Color.academyBlue : .clear)
                }
                .onTapGesture {
                    withAnimation(.smooth) {
                        isChecked.toggle()
                    }
                }
                .border(Color.academyBlack)
            
            Text("\(text)")
                .foregroundStyle(Color.academyBlack)
                .font(.system(size: 19, weight: .semibold))
        }
    }
}

#Preview {
    CheckBox("Remember me", isChecked: true)
}

