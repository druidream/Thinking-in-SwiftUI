//
//  CurveShape.swift
//  BezierCurveDemo
//
//  Created by Jun Gu on 2023/11/16.
//

import Foundation
import PureSwiftUI

private let heartColor: Color = .red
private let heartLayoutConfig = LayoutGuideConfig.grid(columns: 430, rows: 40)

private typealias Curve = (p: CGPoint, cp1: CGPoint, cp2: CGPoint)

private struct CurveShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    var g = heartLayoutConfig.layout(in: rect)

    let p1 = g[156, 0] // col, row
    let p2 = g[177, 15]
    let p3 = g[215, 40]
    let p4 = g[253, 15]
    let p5 = g[274, 0]

    var curves = [Curve]()
    curves.append(Curve(p2, g[166, 0], g[173, 6]))
    curves.append(Curve(p3, g[183, 30], g[198, 40]))
    curves.append(Curve(p4, g[232, 40], g[247, 30]))
    curves.append(Curve(p5, g[258, 6], g[264, 0]))

    path.move(g[0, 0])
    path.line(p1)
    for curve in curves {
      path.curve(curve.p, cp1: curve.cp1, cp2: curve.cp2, showControlPoints: false)
    }

    path.line(g[430, 0])

    return path
  }
}

struct CurveShapeDemo_Preview: PreviewProvider {

  struct HeartShapeDemo_Harness: View {
    var body: some View {
      VStack(spacing: 50) {
        CurveShape()
          .fill(heartColor)
          .frame(200)
        ZStack {
          Image("TabCurve")
//            .resizedToFit(200)
          CurveShape()
            .stroke(Color.black, lineWidth: 2)
            .layoutGuide(heartLayoutConfig)
            .frame(width: 430, height: 40)
//            .offset(y: )
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
//      .showLayoutGuides(true)
  }
}
