//
//  TextButton.swift
//
//
//  Created by Rafael Carreira on 16/11/23.
//

import SwiftUI

/// Cria um botão composto por um texto
///
///  - Parameters:
///     - colorScheme: Esta variável contém informações sobre o modo claro e o modo escuro do dispositivo
///     - text: Esta variável é o texto passado para o botão
///     - action: Esta variável é a ação que o botão irá realizar
///
public struct TextButton: View {
    ///Esta variável contém informações sobre o modo claro e o modo escuro do dispositivo
    @Environment(\.colorScheme) var colorScheme
    ///Esta variável é o texto passado para o botão
    var text: String
    ///Esta variável é a ação que o botão irá realizar
    var action: () -> Void
    
    ///Inicializa as variaveis da Struct
    public init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button(action:{
                action()
        }, label: {
            Text(text)
                .font(.system(size: 18))
                .bold()
                .underline()
                
        }).foregroundStyle(colorScheme == .dark ? Color.academyWhite : Color.academyBlack)
        
            
    }
}
