//
//  SwiftUIView.swift
//  
//
//  Created by Giovanna Bonifacho on 16/11/23.
//

import SwiftUI

struct SegmentedControl: View {
    
    // Para calcular o tamanho do Picker
    let size: CGSize
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            //BackGround do SegmentedControl
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(Color.academyBeige)
                .opacity(0.2)
        }
    }
    
    
    public init(size: CGSize) {
        self.size = size
    }
}

#Preview {
    SegmentedControl(size: CGSize(width: UIScreen.main.bounds.width - 40, height: 48))
}
