//
//  SnapCardView.swift
//  Card Carousel
//
//  Created by Thiago Liporace on 16/11/23.
//

import SwiftUI

/// View Builder que posiciona Views em formato de Carrossel Horizontal.
///
/// Para usar o CarouselView é só chamá-lo como uma View e dentro das chaves ({}) colocar as views que você deseja colocar no carrossel.
///
/// ```swift
/// struct ContentView(){
///   var body: some View {
///   CarouselView(){
///    SuaView()
///    SuaView()
///    SuaView()
///   }
///  }
///}
///
/// ```
///# **Aviso**
///Não é possível usar ForEach ou algum tipo de loop para popular esse carrossel, é necessário chamar cada View a ser utilizadas
///
///  - Parameters:
///     - currentIndex: Armazena a posição atual do card que está sendo mostrado.
///     - views: Vetor de Views que será usado para serem organizados em um Carrossel Horizontal.
public struct CarouselView: View {
    
    /// Armazena a posição atual do card que está sendo mostrado e altera os componentes a sua volta dependendo da sua posição.
    @State private var currentIndex: Int = 0
    
    /// Vetor de Views que será usado para serem organizados em um Carrossel Horizontal.
    var views: [AnyView]
    
    /// Inicializador 
    /// - Parameters:
    ///   - content: Conteúdo genérico para a criação da View
    public init<Views>(@ViewBuilder content: @escaping () -> TupleView<Views>) {
        views = content().getViews
    }
    
    
    /// Corpo que gera a organização em forma de Carrossel Horizontal, utilizando o .gesture do _DragGesture()_ .
    //
    public var body: some View {
        GeometryReader { geometry in
            ZStack() {
                ForEach(views.indices) { index in
                    
                    self.views[index]
                        .scaleEffect(index == currentIndex ? 1.0 : 0.85)
                        .offset(x: CGFloat(index - currentIndex) * (geometry.size.width * 0.75))
                    
                    
                        .zIndex(index == currentIndex ? 1 : index + 2 == currentIndex + 2 ? -1 : -1)
                        
                }
                
            }

            .gesture(
                DragGesture()
                    .onEnded { value in
                        let cardWidth = geometry.size.width * 0.3
                        let offset = value.translation.width / cardWidth
                        
                        withAnimation(Animation.spring()) {
                            
                            if value.translation.width < -offset
                            {
                                currentIndex = min(currentIndex + 1, views.count - 1)
                                
                            }
                            
                            else if value.translation.width > offset {
                                currentIndex = max(currentIndex - 1, 0)
                            }
                        }
                    }
            )
            
        }
        
        .padding()
        .padding(.top, 132)
    }
}

