//
//  SearchField.swift
//
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 14/11/23.
//

import SwiftUI

/// Estilização de um ``SearchField``
/// - Parameters:
/// 	- darkBlue: Caso para estilo azul escuro
/// 	- lightBlue: Caso para estilo azul claro
/// 	- darkPurple: Caso para estilo roxo escuro
/// 	- lightPurple: Caso para estilo roxo claro
public enum SearchFieldStyle {
	/// Caso para estilo azul escuro
	case darkBlue
	/// Caso para estilo azul claro
	case lightBlue
	/// Caso para estilo roxo escuro
	case darkPurple
	/// Caso para estilo roxo claro
	case lightPurple
	
	/// Define a cor principal do estilo do ``SearchField``
	var styleColor: Color {
		switch self {
		case .darkBlue:
			return Color.academyBlue
		case .lightBlue:
			return Color.academyBlue
		case .darkPurple:
			return Color.academyPurple
		case .lightPurple:
			return Color.academyPurple
		}
	}
	
	/// Define a cor de fundo do estilo do ``SearchField``
	var backgroundColor: Color {
		switch self {
		case .darkBlue:
			return Color.academyGray1
		case .lightBlue:
			return Color.academyGray4
		case .darkPurple:
			return Color.academyGray1
		case .lightPurple:
			return Color.academyGray4
		}
	}
	
	/// Define a cor de frente do estilo do ``SearchField``
	var foregroundColor: Color {
		switch self {
		case .darkBlue:
			return Color(.white)
		case .lightBlue:
			return Color(.black)
		case .darkPurple:
			return Color(.white)
		case .lightPurple:
			return Color(.black)
		}
	}
}


/// Apresenta uma interface que as pessoas possam usar para pesquisar por conteúdo em seu aplicativo.
/// Você cria um campo de pesquisa com um texto padrão e uma ligação a um valor String.
/// - Parameters:
///   - prompt: Você pode definir um prompt explícito no campo de texto para orientar os usuários sobre qual texto eles devem fornecer.
///   - text: O texto a ser apresentado e editado
///   - style: O estilo do SearchField
public struct SearchField: View {
	
	let prompt: String
	@Binding var text: String
	let style: SearchFieldStyle
	
	/// Define o estado do SearchField, caso ele está focado ou não
	@State var isClicked = false
	
	/// Cria um SearchField com um rótulo de texto gerado a partir de uma sequência de título localizada.
	/// - Parameters:
	///   - prompt: Você pode definir um prompt explícito no campo de texto para orientar os usuários sobre qual texto eles devem fornecer.
	///   - text: O texto a ser apresentado e editado
	///   - style: O estilo do SearchField
	public init(prompt: String, _ text: Binding<String>, _ style: SearchFieldStyle) {
		self.prompt = prompt
		self._text = text
		self.style = style
	}
	
	public var body: some View {
		HStack {
			HStack {
				Image(systemName: "magnifyingglass")
					.foregroundStyle(style.styleColor)
				
				TextField(prompt, text: $text, onCommit: {
					withAnimation(.easeInOut(duration: 0.3)) {
						isClicked = false
					}
				})
					.foregroundStyle(style.foregroundColor)
				
				Image(systemName: "mic.fill")
					.foregroundStyle(style.styleColor)
			}
			.padding()
			.background(style.backgroundColor)
			.frame(width: isClicked ? 297 : 361, height: 36)
			.clipShape(RoundedRectangle(cornerRadius: 8))
			.padding(.leading)
			.onTapGesture {
				withAnimation(.easeInOut(duration: 0.3)) {
					isClicked = true
				}
			}
			
			Spacer()
			
			if isClicked {
				Button("Cancel") {
					withAnimation(.easeInOut(duration: 0.3)) {
						isClicked = false
					}
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				}
				.transition(.move(edge: .trailing).combined(with: .opacity))
			}
			Spacer()
		}
		.accessibilityLabel("Campo de pesquisa")
		
		
	}
}

#Preview {
	SearchField(prompt: "Prompt", .constant("Hello!"), .lightBlue)
}
