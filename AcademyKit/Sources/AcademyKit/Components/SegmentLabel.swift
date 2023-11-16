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
    
    var body: some View {
        Text(title)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: false)
            .foregroundColor(textColour)
            .frame(width: width)
            .contentShape(Rectangle())
    }
}

#Preview {
    SegmentLabel(title: "One", width: 100, textColour: .academyBlack)
}
