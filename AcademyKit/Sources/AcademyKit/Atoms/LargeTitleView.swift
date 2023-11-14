//
//  SwiftUIView.swift
//  
//
//  Created by Gabriel Vicentin Negro on 14/11/23.
//
import SwiftUI

public enum Weight{
    case boldWeight
    case regularWeight
}

public struct LargeTitleView: View {
    var text: String
    var weight: Weight
    
    public init(text: String, weight: Weight){
        self.text = text
        self.weight = weight
    }
    
    public var body: some View {
        Text(text)
            .font(.custom(weight == .regularWeight ? "Cygre-Regular" : "Cygre-Bold", size: 34))
    }
}

#Preview {
    LargeTitleView(text: "LargeTitle", weight: .regularWeight)
}
