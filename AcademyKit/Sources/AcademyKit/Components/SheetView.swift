//
//  SheetView.swift
//  SheetComponent
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 16/11/23.
//

import SwiftUI


/// Adiciona uma View por cima da atual. Recebe um parâmetro que dita caso a ``SheetView`` está sendo apresentada, um título e conteúdo que serão apresentados dentro da ``SheetView`` .
///
/// - Parameters:
/// 	- sheetIsPresented: Dita se a View está sendo apresentada
/// 	- title: Título apresentado na View
/// 	- view: Conteúdo apresentado na View
public struct SheetView<Content: View>: View {
	
	/// Dita se a View está sendo apresentada
	@Binding var sheetIsPresented: Bool
	/// Título apresentado na View
	let title: String
	/// Conteúdo apresentado na View
	var view: Content

	
	/// Disponibiliza a apresentação de uma View secundária que aparece por cima da View atual
	/// - Parameters:
	///   - sheetIsPresented: Dita se a View está sendo apresentada
	///   - title: Título apresentado na View
	///   - _ view: Conteúdo apresentado na View
	public init(sheetIsPresented: Binding<Bool>, title: String, @ViewBuilder _ view: () -> Content) {
		self._sheetIsPresented = sheetIsPresented
		self.title = title
		self.view = view()
	}
	
	public var body: some View {
		NavigationStack {
			
		}
		.sheet(isPresented: $sheetIsPresented) {
			SheetContentView(title: title) {
				view
			}
			.presentationDragIndicator(.visible)
		}
	}
}

