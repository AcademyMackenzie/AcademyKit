//
// Card.swift
// CardCarousel
//
// Created by Raphael Iniesta Reis on 17/11/23.
//
import SwiftUI
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
    public var color: String {
        switch self {
        case .coder: return "academyBlue"
        case .designer: return "academyPurple"
        case .po: return "academyRed"
        }
    }
}
public struct Card: View {
    public var name: String
    public var description: String
    public var role: RoleEnum
    public init(name: String, description: String, role: RoleEnum) {
        self.name = name
        self.description = description
        self.role = role
    }
    public var body: some View {
        GeometryReader { geo in
            ZStack{
                RoundedRectangle(cornerRadius: 15.0)
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
                        .padding(.bottom,5)
                    Text(description)
                        .font(.body)
                    HStack {
                        Text(role.role)
                            .font(.callout)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "swift")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(role.color))
                            .frame(width: geo.size.width / 13.5, height: geo.size.height / 31.35)
                    }
                }
                .padding()
                .foregroundStyle(.black)
                .frame(width: geo.size.width / 1.68, height: geo.size.height / 2.3)
            }
        }
    }
}
public struct RoundedCorner: Shape {
    public var radius: CGFloat = .infinity
    public var corners: UIRectCorner = .allCorners
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    public func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
#Preview {
    Card(name: "igor", description: "This is a short description about the card", role: .coder)
}
