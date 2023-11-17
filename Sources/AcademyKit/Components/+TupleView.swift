//
//  File.swift
//  
//
//  Created by Thiago Liporace on 17/11/23.
//

import SwiftUI

/// Extensão que recebe mútliplas Views e gera um Vetor (Array) a partir dessas VIews
public extension TupleView {
    /// Variável que recebe as Views
    var getViews: [AnyView] {
        makeArray(from: value)
    }
    
    /// Estrutura genérica para gerar uma AnyView
    struct GenericView {
        let body: Any
        var anyView: AnyView? {
            AnyView(_fromValue: body)
        }
    }
    
    /// Função que pega os bytes onde está a View, criando uma VIew genérica a partir desses bytes, e depois armazenando elas em um Vetor (Array).
    /// - Parameter tuple: Vetor das Views genéricas
    /// - Returns: Vetor de Views resultante
    func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
        
        ///Função responsável pela conversão de bytes em VIew genérica
        func convert(child: Mirror.Child) -> AnyView? {
            withUnsafeBytes(of: child.value) { ptr -> AnyView? in
                let binded = ptr.bindMemory(to: GenericView.self)
                return binded.first?.anyView
            }
        }
        
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.compactMap(convert)
    }
}

