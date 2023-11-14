//
//  File.swift
//  
//
//  Created by André Arteca on 14/11/23.
//

import Foundation
import SwiftUI

/// Variações do Pill Button
///
/// -   Parameters:
///     - primary: Botões de cor azul
///     - secundary: Botões de cor roxa
///     - tertiary: Botões de cores cinza e preto
public enum PillButtonEnum {
    case primary
    case secondary
    case tertiary
}

/// Estilo de botão em forma de cápsula, que pode ser usado como a label de um Picker
///
/// -   Parameters:
///      - type: Variação do Pill Button, tipo PillButtonEnum
///      - isFilled: Altera o preenchimento do botão, tipo booleana, opcional
///      - isPicker: Adiciona o chevron para definir o picker, tipo booleana, opcional
///
/// Utilize o PillButtonStyle como um Button Style e coloque os parâmetros desejados para alterar a aparência do botão:
/// ```swift
/// Button("Toque aqui"){
///   print("botão")
///}
///     .buttonStyle(PillButtonStyle(type: .secondary, isFilled: true, isPicker: true))
/// ```

 public struct PillButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) var colorScheme
    public var type: PillButtonEnum
    public var isFilled: Bool
    public var isPicker: Bool? = false
    public var color: Color {
        switch type {
        case .primary:
            return .academyBlue
        case .secondary:
            return .academyPurple
        case .tertiary:
            return isFilled ? .academyAccentDarkMode : .academyGra2
        }
    }
    
    
     
    public func makeBody(configuration: Configuration) -> some View {
  
            if isFilled == true{
                // botão com fundo
                HStack(alignment:.center, spacing: 4){
                    configuration.label
                        .font(.custom("Cygre-Regular", size: 14))
                    if isPicker == true {
                        Image(systemName: "chevron.compact.down")
                            .fontWeight(.semibold)
                            .accessibilityLabel("toque duas vezes para mais opções")

                    } else {}
                }
                
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background(color)
                    .clipShape(Capsule())
            } else {
                // botão traçado
                HStack(alignment:.center, spacing: 4){
                    configuration.label
                        .font(.custom("Cygre-Regular", size: 14))
                    if isPicker == true {
                        Image(systemName: "chevron.compact.down")
                            .fontWeight(.semibold)
                            .accessibilityLabel("toque duas vezes para mais opções")

                    }
                }
                    .foregroundStyle(type == .tertiary ? color: colorScheme == .dark ? .white : .black)
                    .padding(10)
                    .padding(.horizontal, 5)
                    .overlay(
                        Capsule(style: .continuous)
                            .stroke(color, style: StrokeStyle(lineWidth: 1))
                        )
            }
        
        
        
     
    }
}


#Preview{
        Button("Primary"){
            print("oi")
        }
        .buttonStyle(PillButtonStyle(type: .secondary, isFilled: true, isPicker: true))
    
}
