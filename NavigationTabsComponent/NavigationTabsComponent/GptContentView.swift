//
//  GptContentView.swift
//  NavigationTabsComponent
//
//  Created by Jun Gu on 2023/12/5.
//

import SwiftUI
struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let cornerRadii = CGSize(width: radius, height: radius)
        let pathRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)

        path.move(to: CGPoint(x: pathRect.minX, y: pathRect.maxY))

        if corners.contains(.topLeft) {
            path.addArc(center: CGPoint(x: pathRect.minX + radius, y: pathRect.minY + radius), radius: radius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: pathRect.minX, y: pathRect.minY))
        }

        // Add straight line or arc for top-right corner
        if corners.contains(.topRight) {
            path.addArc(center: CGPoint(x: pathRect.maxX - radius, y: pathRect.minY + radius), radius: radius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: pathRect.maxX, y: pathRect.minY))
        }

        // Add straight line or arc for bottom-right corner
        if corners.contains(.bottomRight) {
            path.addArc(center: CGPoint(x: pathRect.maxX - radius, y: pathRect.maxY - radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: pathRect.maxX, y: pathRect.maxY))
        }

        // Add straight line or arc for bottom-left corner
        if corners.contains(.bottomLeft) {
            path.addArc(center: CGPoint(x: pathRect.minX + radius, y: pathRect.maxY - radius), radius: radius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        } else {
            path.addLine(to: CGPoint(x: pathRect.minX, y: pathRect.maxY))
        }

        return path
    }
}

struct RoundedCornerExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(width: 200, height: 100)
            .foregroundColor(.blue)
            .overlay(Text("Hello, SwiftUI!").foregroundColor(.white))
            .clipShape(RoundedCorner(radius: 20, corners: [.topLeft]))
    }
}

struct GptContentView: View {
    var body: some View {
        VStack {
            Text("Rounded Corner Example")
            RoundedCornerExample()
        }
        .padding()
    }
}


#Preview {
  GptContentView()
}
