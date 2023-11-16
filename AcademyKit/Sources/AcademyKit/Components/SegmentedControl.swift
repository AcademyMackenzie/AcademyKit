//
//  SwiftUIView.swift
//  
//
//  Created by Giovanna Bonifacho on 16/11/23.
//

import SwiftUI

struct SegmentedControl: View {
    
    @Binding public var selection: Int
    public var isSelected: String
    @State var selected: String = ""
    // Para calcular o tamanho do Picker
    let size: CGSize
    let segmentLabels: [String]
    
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            //            BackGround do SegmentedControl
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(.gray)
                .opacity(0.2)
//                .padding(.horizontal)
            
            
            //            BackGround da Label selecionada
            RoundedRectangle(cornerRadius: 10)
                .frame(width: segmentWidth(size), height: size.height - 6)
                .foregroundColor(.academyBlue)
                .offset(x: calculateSegmentOffset(size))
                .animation(Animation.easeInOut(duration: 0.2))
            
            //            Labels
            HStack(spacing: 0) {
                ForEach(0..<segmentLabels.count) { index in
                    SegmentLabel(title: segmentLabels[index], width: segmentWidth(size), textColour: colorScheme == .light ? Color.academyBlack : Color.academyWhite, isSelected: $selected)
                    // dar um update no selection com o id do segmento da label
                        .onTapGesture {
                            selection = index
                            print("\(index)")
                            selected = segmentLabels[index]
                            
                        }

                }
            }
        }.onAppear() {
            selected = isSelected

            for number in segmentLabels.indices {
                
                if segmentLabels[number] == selected {
                    selection = number
                    break
                }
            }
            
        }
        
    }
    
    
    public init(selection: Binding <Int>, size: CGSize, segmentLabels: [String], isSelected: String) {
        self._selection = selection
        self.size = size
        self.segmentLabels = segmentLabels
        self.isSelected = isSelected
    }
    
    //Segmenta a width para o tamanho da Label selecionada de acordo com sua quantidade
    func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        var width = (mainSize.width / CGFloat(segmentLabels.count))
        if width < 0 {
            width = 0
        }
        return width
    }
    
    // Transporte da Label selecionada para a outra
    func calculateSegmentOffset(_ mainSize: CGSize) -> CGFloat {
        segmentWidth(mainSize) * CGFloat(selection)
    }
    
    
}

#Preview {
    SegmentedControl(selection: .constant(0), size: CGSize(width: UIScreen.main.bounds.width - 40, height: 48), segmentLabels: ["One", "Two", "Three"], isSelected: "One")
}
