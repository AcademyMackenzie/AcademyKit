//
//  SwiftUIView.swift
//  
//
//  Created by Raphael Iniesta Reis on 24/11/23.
//

import SwiftUI

struct CheckBox: View {
    @State var text: String
    @State var isChecked: Bool
    
    init(_ text: String, isChecked: Bool) {
        self.text = text
        self.isChecked = isChecked
    }
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 19, height: 19)
                .foregroundStyle(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 2)
                        .frame(width: 13, height: 13)
                        .foregroundStyle(isChecked ? Color.academyBlue : .clear)
                }
                .onTapGesture {
                    withAnimation(.smooth) {
                        isChecked.toggle()
                    }
                }
                .border(Color.academyBlack)
            
            Text("\(text)")
                .foregroundStyle(Color.academyBlack)
                .font(.system(size: 19, weight: .semibold))
        }
    }
}

#Preview {
    CheckBox("Remember me", isChecked: true)
}

