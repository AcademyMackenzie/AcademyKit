//
//  SwiftUIView.swift
//  
//
//  Created by Giovanna Bonifacho on 16/11/23.
//

import SwiftUI


/// View que representa a costumização de um Picker do tipo SegmentedControl com a identidade visual do AcademyKit
///
/// Cria uma variável de Estado para alternar entre as labels disponíveis no SegmentedControl, que serão selecionadas pelo usuário.
/// ```swift
/// @State var segmentSelection: Int = 0
///
///var body: some View {
///         VStack {
///                 SegmentedControl(selection: $segmentSelection, size: CGSize(width: 350, height: 48), segmentLabels: ["One", "Two", "Three"], isSelected: "One")
///                }
///}
///
/// ```
struct SegmentedControl: View {
    
    /// Variável que determina a label que está selecionada pelo usuário.
    @Binding public var selection: Int
    
    /// Variável que determina qual label estará pré-selecionada.
    public var predeterminedSelected: String
    
    /// Variável que determina o estado de seleção da label.
    @State var isSelected: String = ""
    
    /// Variável que serve para determinar o tamanho do Picker
    let size: CGSize
    
    /// Variável que armazena uma lista de Strings com todas as Labels que estarão no picker.
    let segmentLabels: [String]
    
    
    /// Variável para definir cor de acordo com o modo das telas.
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    /// Corpo da View que contém o componente completo do SegmentedControl
    var body: some View {
        ZStack(alignment: .leading) {
            
            //BackGround do SegmentedControl
            RoundedRectangle(cornerRadius: 10)
                .frame(width: size.width, height: size.height)
                .foregroundColor(.gray)
                .opacity(0.2)
            
            
            //BackGround da Label selecionada
            RoundedRectangle(cornerRadius: 10)
                .frame(width: segmentWidth(size), height: size.height - 6)
                .foregroundColor(.academyBlue)
                .offset(x: calculateSegmentOffset(size))
                .animation(Animation.easeInOut(duration: 0.2))
            
            //Labels
            HStack(spacing: 0) {
                // ForEach que passa por toda a lista das labels e cria o picker com essas labels de acordo com a quantidade para se adequar ao tamanho
                ForEach(0..<segmentLabels.count) { index in
                    SegmentLabel(title: segmentLabels[index], width: segmentWidth(size), textColour: colorScheme == .light ? Color.academyBlack : Color.academyWhite, isSelected: $isSelected)
                    // dar um update no selection com o id do segmento da label
                        .onTapGesture {
                            selection = index
                            print("\(index)")
                            isSelected = segmentLabels[index]
                            
                        }

                }
            }
        }.onAppear() {
            isSelected = predeterminedSelected

            for number in segmentLabels.indices {
                
                if segmentLabels[number] == isSelected {
                    selection = number
                    break
                }
            }
            
        }
        
    }
    
    
    /// Criar um Picker do estilo Segmented Control customizado com a identidade visual do AcademyKit
    /// - Parameters:
    ///   - selection: Label que está selecionada pelo usuário.
    ///   - size: Tamanho do picker.
    ///   - segmentLabels: Lista com todas as labels que estarão no picker.
    ///   - predeterminedSelected: Determina qual label estará pré-selecionada.
    public init(selection: Binding <Int>, size: CGSize, segmentLabels: [String], predeterminedSelected: String) {
        self._selection = selection
        self.size = size
        self.segmentLabels = segmentLabels
        self.predeterminedSelected = predeterminedSelected
    }
    
    
    /// Função que faz a segmentação da largura de uma label de acordo com a quantidade de labels que constituem o picker.
    /// - Parameter mainSize: Parâmetro que determina a largura de uma label.
    /// - Returns: Retorna o valor da largura do picker com todas as labels.
    func segmentWidth(_ mainSize: CGSize) -> CGFloat {
        var width = (mainSize.width / CGFloat(segmentLabels.count))
        if width < 0 {
            width = 0
        }
        return width
    }
    
    // Transporte da Label selecionada para a outra
    /// Função que faz o transporte de uma label para outra.
    /// - Parameter mainSize: Parâmetro que determina a largura de uma label.
    func calculateSegmentOffset(_ mainSize: CGSize) -> CGFloat {
        segmentWidth(mainSize) * CGFloat(selection)
    }
    
    
}

#Preview {
    SegmentedControl(selection: .constant(0), size: CGSize(width: UIScreen.main.bounds.width - 40, height: 48), segmentLabels: ["One", "Two", "Three"], predeterminedSelected: "One")
}
