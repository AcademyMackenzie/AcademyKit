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
    let segmentLabels: [String]
    
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            //BackGround do SegmentedControl
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(Color.academyBeige)
                .opacity(0.2)
            
            
            //Labels
            HStack(spacing: 0) {
                ForEach(0..<segmentLabels.count) { index in
                    SegmentLabel(title: segmentLabels[index], width: segmentWidth(size), textColour: Color.black)
                            }
                        }
        }
    }
    
    
    public init(size: CGSize, segmentLabels: [String]) {
        self.size = size
        self.segmentLabels = segmentLabels
    }
    
//    Segmenta a width pela quantidade de Labels adicionadas
    public func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        var width = (mainSize.width / CGFloat(segmentLabels.count))
        if width < 0 {
            width = 0
        }
        return width
    }
    
}

#Preview {
    SegmentedControl(size: CGSize(width: UIScreen.main.bounds.width - 40, height: 48), segmentLabels: ["One", "Two", "Three"])
}
