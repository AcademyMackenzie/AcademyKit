//
//  Tab1.swift
//  TabBar
//
//  Created by Raphael Iniesta Reis on 14/11/23.
//

import SwiftUI

/// Responsável por selecionar o texto da Label
///
///  - Parameters:
///     - home: Adiciona o texto "Home" na TabBar
///     - pesquisar: Adicionar o texto "Pesquisar" na TabBar
///     - favoritos: Adiciona o texto "Favoritos" na TabBar
///     - usuario: Adiciona o texto "Usuário" na TabBar
public enum TextEnum {
    case home
    case pesquisar
    case favoritos
    case usuario
}

/// Responsável por selecionar ícone da Label
///
///  - Parameters:
///     - casa: Adiciona SFsymbol "house"
///     - lupa: Adiciona SFsymbol "magnifiyngglass"
///     - coracao: Adiciona SFsymbol "heart"
///     - pessoa: Adiciona SFsymbol "person"
public enum ImageEnum{
    case casa
    case lupa
    case coracao
    case pessoa
}

/// Componente de estilização de Labels para a TabBar
///
/// - Parameters:
///   - text: Variável que recebe parâmetros do TextEnum
///   - image: Variável que recebe parâmetros de ImageEnum
public struct TabBarLabel: View {
    public var text: TextEnum
    public var image: ImageEnum
    
    /// Inicializador dos termos
    ///
    /// - Parameters:
    ///     - text: Inicializador da variável ___text___
    ///     - image: Inicializador da variável ___image___
    public init(text: TextEnum, image: ImageEnum, isToggled: Int) {
        self.text = text
        self.image = image
    }
    
    public var body: some View {
            Label(text == .home ? "Home" : text == .pesquisar ? "Pesquisar" : text == .favoritos ? "Favoritos" : "Usuário", systemImage: image == .casa ? "house" : image == .lupa ? "magnifyingglass" : image == .coracao ? "heart" : "person")
                .foregroundStyle(Color("academyBlue"))
    }
}
