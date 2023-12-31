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
///
public struct TextButton: View {
    ///Esta variável contém informações sobre o modo claro e o modo escuro do dispositivo
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.isEnabled) var isEnabled
    ///Esta variável é o texto passado para o botão
    var text: String
    
    ///Inicializa as variaveis da Struct
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
   
        Text(text)
                .font(.custom("Cygre-Bold", size: 18))
                .bold()
                .underline(isEnabled)
        ///Mudança de cor do texto
        ///
        ///Esta estrutura de código define a cor do texto a partir de verificações de condições sequenciais, primeiro é verificado se o dispositvo está no dark mode ou no light mode, e depois é verificado se a struct está desabilitada.
                .foregroundStyle(colorScheme == .dark ? isEnabled ?  Color.academyWhite : Color.academyGray1 : isEnabled ?  Color.academyBlack : Color.academyGray1 )
            
    }
}

#Preview {
    TextButton("Cancelar").disabled(true)
}
