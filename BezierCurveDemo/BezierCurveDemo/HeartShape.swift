//
//  CurveShape.swift
//  BezierCurveDemo
//
//  Created by Jun Gu on 2023/11/16.
//

import Foundation

import PureSwiftUI

private let heartColor: Color = .red
private let heartLayoutConfig = LayoutGuideConfig.grid(columns: 8, rows: 10)

private typealias Curve = (p: CGPoint, cp1: CGPoint, cp2: CGPoint)

private struct Heart: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    var g = heartLayoutConfig.layout(in: rect)

    let p1 = g[0, 3]
    let p2 = g[4, 2]
    let p3 = g[8, 3]
    let p4 = g[4, 10]

    var curves = [Curve]()
    curves.append(Curve(p2, g[0, 0], g[3, -1]))
    curves.append(Curve(p3, g[5, -1], g[8, 0]))
    curves.append(Curve(p4, g[8, 5], g[5, 7]))
    curves.append(Curve(p1, g[3, 7], g[0, 5]))

    path.move(p1)
    for curve in curves {
      path.curve(curve.p, cp1: curve.cp1, cp2: curve.cp2, showControlPoints: true)
    }

    return path
  }
}

struct HeartShapeDemo_Preview: PreviewProvider {

  struct HeartShapeDemo_Harness: View {
    var body: some View {
      VStack(spacing: 50) {
        Heart()
          .fill(heartColor)
          .frame(200)
        ZStack {
          Image("heart")
            .resizedToFit(200)
          Heart()
            .stroke(Color.black, lineWidth: 2)
            .layoutGuide(heartLayoutConfig)
            .frame(200)
//            .fill(heartColor)
        }
      }
    }
  }

  static var previews: some View {
    HeartShapeDemo_Harness()
      .padding(50)
      .previewDevice(.iPhone_8)
      .previewSizeThatFits()
      .showLayoutGuides(true)
  }
}
