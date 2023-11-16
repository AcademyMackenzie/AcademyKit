//
//  Tab1.swift
//  TabBar
//
//  Created by Raphael Iniesta Reis on 14/11/23.
//

import SwiftUI

public enum TextEnum{
    case home
    case pesquisar
    case favoritos
    case usuário
}

public enum ImageEnum{
    case casa
    case lupa
    case coracao
    case pessoa
}

public struct TabBarLabel: View {
    public var text: TextEnum
    public var image: ImageEnum
    public var isToggled: Int
    
    public init(text: TextEnum, image: ImageEnum, isToggled: Int) {
        self.text = text
        self.image = image
        self.isToggled = isToggled
    }
    
    public var body: some View {
            Label(text == .home ? "Home" : text == .pesquisar ? "Pesquisar" : text == .favoritos ? "Favoritos" : "Usuário", systemImage: image == .casa ? "house" : image == .lupa ? "magnifyingglass" : image == .coracao ? "heart" : "person")
                .foregroundStyle(Color("academyBlue"))
    }
}
