//
// Card.swift
// CardCarousel
//
// Created by Raphael Iniesta Reis on 17/11/23.
//

import SwiftUI

/// Enum de cargos do card
///
/// - Parameters:
///   - coder: Designa o cargo de coder
///   - designer: Designa o cargo de designer
///   - po: Designa o cargo de product person
public enum RoleEnum {
  case coder
  case designer
  case po
  public var role: String {
    switch self {
    case .coder: return "Coder"
    case .designer: return "Designer"
    case .po: return "Product Person"
    }
  }
  public var color: Color {
    switch self {
    case .coder: return Color.academyBlue
    case .designer: return Color.academyPurple
    case .po: return Color.academyRed
    }
  }
    public var image: String {
        switch self {
        case .coder: return "swift"
        case .designer: return "paintbrush.fill"
        case .po: return "scroll.fill"
        }
    }
}

/// Card pesonalizado para mostrar a equipe de desenvoldimento
///
/// - Parameters:
///   - name: String do nome do membro
///   - description: Uma breve descrição sobre o membro
///   - role: Cargo que essa pessoa ocupa
public struct CardCarousel: View {
    
  public var name: String
  public var description: String
  public var role: RoleEnum
    
    /// Inicia as variáveis para serem usados
      ///
      /// - Parameters:
      ///   - self.name: Recebe o nome do membro
      ///   - self.description: Recebe a descrição do membro
      ///   - self.role: Recebe o cargo do membro
  public init(name: String, description: String, role: RoleEnum) {
    self.name = name
    self.description = description
    self.role = role
  }
  public var body: some View {
    GeometryReader { geo in
      ZStack{
        RoundedRectangle(cornerRadius: 15.0)
              .shadow(radius: 2)
          .frame(width: geo.size.width / 1.68, height: geo.size.height / 2.3)
          .foregroundStyle(.white)
        VStack(alignment: .leading, spacing:0) {
          Image(name)
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width / 1.9, height: geo.size.height / 4.43)
            .cornerRadius(radius: 8, corners: [.topLeft, .topRight])
            .padding(.top, -20)
           
          Text(name)
            .font(.title)
            .fontWeight(.bold)
            .padding(.top, 5)
            .padding(.bottom,10)
          Text(description)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.academyGray1)
            .font(.body)
            .padding(.bottom,2)
          HStack {
            Text(role.role)
                  .foregroundStyle(Color.academyGray4)
              .font(.callout)
              .fontWeight(.bold)
              .padding(.top,20)
            Spacer()
              Image(systemName: role.image)
              .foregroundStyle(role.color)
              .font(.title2)
              .fontWeight(.bold)
              .padding(.top,20)
              
          }
            
        }
        .padding()
        .foregroundStyle(.black)
        .frame(width: geo.size.width / 1.68, height: geo.size.height / 2.3)
      }
      
    }
  }
}

/// É um formato cutomizado que permite a personalização do raio de cantos individuais da forma
///
/// - Parameters:
///   - radius: O raio do canto
///   - corners: Cada um dos cantos
struct RoundedCorner: Shape {
  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}
extension View {
  func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCorner(radius: radius, corners: corners))
  }
}
#Preview {
  CardCarousel(name: "Igor Bragança", description: "This is a short description about the card", role: .designer)
}
