//
//  SwiftUIView.swift
//  
//
//  Created by Giovanna Bonifacho on 23/11/23.
//

import SwiftUI


/// Estilo de toggle customizado com a identidade do AcademyKit
public struct CustomToggleStyle: ToggleStyle {
    
    
    /// Inicializador do CustomToggleStyle
    public init() {
    }
    
    
    /// Variável do tipo ColorScheme para fazer a troca entre light e dark mode
    @Environment(\.colorScheme) public var colorScheme: ColorScheme
    
    
    /// Função que cria a customização do toggle com a identidade visual do AcademyKit
    /// - Parameter configuration: Representa o Toggle que será alterado.
    /// - Returns: O tipo ToggleStyle retorna o estilo que foi criado.
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .fill(configuration.isOn ? LinearGradient(colors: colorScheme == .light ? [Color.academyBlue, Color.academyPurple] : [Color.academyDarkBlue, Color.academyDarkPurple], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [.academyGra2, .academyGra2], startPoint: .leading, endPoint: .trailing))
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Group {
                        if configuration.isOn {
                            Text("l")
                                .padding(.vertical, 20)
                                .offset(x: -11, y: 0)
                                .font(.title3)
                                .foregroundColor(.academyWhite)
                        } else {
                            Image(systemName: "circle")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundColor(.academyGray1)
                                .offset(x: 11, y: 0)
                                .bold()
                        }
                    }
                )
                .overlay(
                    Circle()
                        .fill(.white.shadow(.drop(color: .academyGray1, radius: 3, x: 0, y: 3)))
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                
                )
            
                .cornerRadius(20)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}

//#Preview {
//    CustomToggleStyle()
//}


