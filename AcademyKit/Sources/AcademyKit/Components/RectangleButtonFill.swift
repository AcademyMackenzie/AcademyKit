//
//  RectangleButton.swift
//  RectangleButton
//
//  Created by Thiago Liporace on 14/11/23.
//

import SwiftUI

struct RectangleButtonFill: ButtonStyle {
    
    var hasIcon: Bool
    var isRectangleButtonDisabled: Bool
    var buttonType: RectangleButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 15){
            if hasIcon{
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
            }
            
            configuration.label
            
                .font(.custom("Cygre", size: 17))
                .bold()
                .foregroundStyle(Color.white)
            
        }
        .padding(.vertical, hasIcon ? 16 : 16)
        .padding(.horizontal, hasIcon ? 29 : 40)
        
        .background(isRectangleButtonDisabled ? Color.academyGra2 : buttonType == .primary ? (configuration.isPressed ? Color.academyDarkBlue : Color.academyBlue)  : (configuration.isPressed ? Color.academyDarkPurple : Color.academyPurple))
        .clipShape(RoundedRectangle(cornerRadius: 8))
       
    }
}

#Preview {
    
    Button("Primary"){
        
    }.buttonStyle(RectangleButtonFill(hasIcon: true, isRectangleButtonDisabled: false, buttonType: .tertiary))
}
