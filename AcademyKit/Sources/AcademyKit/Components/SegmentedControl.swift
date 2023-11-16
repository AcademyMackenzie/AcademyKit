//
//  SwiftUIView.swift
//  
//
//  Created by Giovanna Bonifacho on 16/11/23.
//

import SwiftUI

struct SegmentedControl: View {
    
    
    @Binding public var selection: Int
    
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
            
            //            BackGround da Label selecionada
            RoundedRectangle(cornerRadius: 10)
                .frame(width: segmentWidth(size), height: size.height - 6)
                .foregroundColor(Color("academyBlue"))
                .offset(x: calculateSegmentOffset(size))
                .animation(Animation.easeInOut(duration: 0.2))
            
            //Labels
            HStack(spacing: 0) {
                ForEach(0..<segmentLabels.count) { index in
                    SegmentLabel(title: segmentLabels[index], width: segmentWidth(size), textColour: Color.academyBlack)
                    // dar um update no selection com o id do segmento da label
                        .onTapGesture {
                            selection = index
                            print("\(index)")
                        }
                            }
                
                        }
        }
    }
    
    
    public init(size: CGSize, segmentLabels: [String], selection: Binding <Int>) {
        self.size = size
        self.segmentLabels = segmentLabels
        self._selection = selection
    }
    
//    Segmenta a width pela quantidade de Labels adicionadas
    public func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        var width = (mainSize.width / CGFloat(segmentLabels.count))
        if width < 0 {
            width = 0
        }
        return width
    }
    
    // Transporte da Label selecionada para a outra
    public func calculateSegmentOffset(_ mainSize: CGSize) -> CGFloat {
        segmentWidth(mainSize) * CGFloat(selection)
    }
    
}

#Preview {
    SegmentedControl(size: CGSize(width: UIScreen.main.bounds.width - 40, height: 48), segmentLabels: ["One", "Two", "Three"], selection: .constant(0))
}
