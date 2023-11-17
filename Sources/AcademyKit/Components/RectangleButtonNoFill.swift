//
//  RectangleButton.swift
//  RectangleButton
//
//  Created by Thiago Liporace on 14/11/23.
//

import SwiftUI

/// Esse é o __RectangleButton__ sem preenchimento, ou seja, somente com as bordas.
/// 
///  - Parameters:
///     - hasIcon: Booleano para indicar se o botão vai ter um ícone ou não.
///     - isRectangleDisabled: Booleano para indicar se o botão está ativo ou não.
///     - buttonType: Enum declarado no ``RectangleButtonEnum``, serve para trocar a cor do botão.
public struct RectangleButtonNoFill: ButtonStyle {
    
    ///Booleano para indicar se o botão vai ter um ícone ou não.
    public var hasIcon: Bool
    ///Booleano para indicar se o botão está ativo ou não.
    public var isRectangleButtonDisabled: Bool
    ///Enum declarado no ``RectangleButtonEnum``, serve para trocar a cor do botão.
    public var buttonType: RectangleButtonEnum
    
    /// Essa função cria o corpo para esse ButtonStyle.
    /// - Parameter configuration: Representa o Botão que será alterado.
    /// - Returns: O tipo ButtonStyle sempre retorna o estilo que foi criado.
    public func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 15){
            if hasIcon{
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
            }
            
            configuration.label
            
                .font(.custom("Cygre-ExtraBold", size: 17))
                .bold()
                .foregroundStyle(Color.white)
            
        }
        .padding(.vertical, hasIcon ? 16 : 16)
        .padding(.horizontal, hasIcon ? 29 : 40)
        
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isRectangleButtonDisabled ? Color.academyGra2 : buttonType == .primary ? (configuration.isPressed ? Color.academyDarkBlue : Color.academyBlue)  : (configuration.isPressed ? Color.academyDarkPurple : Color.academyPurple), lineWidth: 1)
        )
    
       
    }
}

#Preview {
    ZStack{
        
        Color.black
        
        Button("Secondary"){
            
        }
        .buttonStyle(RectangleButtonNoFill(hasIcon: true, isRectangleButtonDisabled: false, buttonType: .primary))
    }
    
        
}
