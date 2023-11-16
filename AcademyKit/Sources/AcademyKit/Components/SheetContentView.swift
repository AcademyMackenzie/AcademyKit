//
//  SheetContentView.swift
//  SheetComponent
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 16/11/23.
//

import SwiftUI

/// A estrutura estilizada da ``SheetView``.
/// - Parameters:
/// 	- title: Título apresentado na ``SheetView``.
/// 	- insideView: Conteúdo apresentado na ``SheetView``.
struct SheetContentView <Content: View>: View {
	
	@Environment(\.dismiss) private var dismiss
	/// Título apresentado na ``SheetView``.
	let title: String
	/// Conteúdo apresentado na ``SheetView``.
	var insideView: Content
	
	/// Cria a View estilizada da ``SheetView``.
	/// - Parameters:
	///   - title: Título aprensetado na ``SheetView``.
	///   - _: Conteúdo apresentado na ``SheetView``.
	init(title: String, @ViewBuilder _ insideView: () -> Content) {
		self.title = title
		self.insideView = insideView()
	}
	
	var body: some View {
		NavigationStack {
			VStack {
				HStack {
					Text(title)
						.font(.custom("Cygre-Regular", size: 28))
						.bold()
					Spacer()
				}
				insideView
			}
			
			
			.toolbar {
				ToolbarItem(placement: .confirmationAction) {
					Button {
						dismiss()
					} label: {
						Image(systemName: "xmark.circle.fill")
							.resizable()
							.foregroundStyle(Color.academyGray1, Color.academyGray4)
							.frame(width: 30, height: 30)
					}
				}
			}
			
			
			
		}
	}
}

