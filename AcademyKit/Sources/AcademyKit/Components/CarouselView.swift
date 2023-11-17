//
//  SnapCardView.swift
//  Card Carousel
//
//  Created by Thiago Liporace on 16/11/23.
//

import SwiftUI

struct CarouselView: View {
    @State private var currentIndex: Int = 0
    
    var views: [AnyView]
    
    init<Views>(currentIndex: Int, @ViewBuilder content: @escaping () -> TupleView<Views>) {
        self.currentIndex = currentIndex
        views = content().getViews
    }
    
    
    var body: some View {
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

