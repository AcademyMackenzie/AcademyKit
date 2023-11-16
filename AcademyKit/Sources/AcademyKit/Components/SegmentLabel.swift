//
//  SwiftUIView.swift
//  
//
//  Created by Júlia Luz on 16/11/23.
//

import SwiftUI

struct SegmentLabel: View {
    
    //variável para determinar o título
    let title: String
    //variável para determinar o tamanho da label
    let width: CGFloat
    //variável para determinar a cor do título
    let textColour: Color
    
    @Binding var isSelected: String
    
    var body: some View {
        ZStack {
            Text(title)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: false)
                .foregroundColor(textColour)
                .frame(width: width)
                .contentShape(Rectangle())
                .fontWeight(isSelected == title ? .bold : .regular)
        }
        
    }
}

#Preview {
    SegmentLabel(title: "One", width: 100, textColour: .academyBlack, isSelected: .constant("One"))
}
