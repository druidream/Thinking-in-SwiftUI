//
//  ShowcaseHelper.swift
//  ShowcaseView
//
//  Created by Jun Gu on 2023/11/18.
//

import SwiftUI

extension View {
  @ViewBuilder
  func showCase(order: Int, title: String, cornerRadius: CGFloat, style: RoundedCornerStyle, scale: CGFloat = 1) -> some View {
    self.anchorPreference(key: HighlightAnchorKey.self, value: .bounds) { anchor in
      let highlight = Highlight(anchor: anchor, title: title, cornerRadius: cornerRadius, style: style, scale: scale)
      return [order: highlight]
    }
  }
}

struct ShowcaseRoot: ViewModifier {
  var showHighlights: Bool
  var onFinished: () -> ()

  @State private var highlightOrder: [Int] = []
  @State private var currentHighlight: Int = 0
  @State private var showView: Bool = true
  @Namespace private var animation
  func body(content: Content) -> some View {
    content
      .onPreferenceChange(HighlightAnchorKey.self) { value in
        highlightOrder = Array(value.keys).sorted()
      }
      .overlayPreferenceValue(HighlightAnchorKey.self) { preferences in
        if highlightOrder.indices.contains(currentHighlight), showHighlights, showView {
          if let highlight = preferences[highlightOrder[currentHighlight]] {
            HighlightView(highlight)
          }
        }
      }
  }

  @ViewBuilder
  func HighlightView(_ highlight: Highlight) -> some View {
    GeometryReader { proxy in
      let highlightRect = proxy[highlight.anchor]
      let safeAres = proxy.safeAreaInsets
      Rectangle()
        .fill(.black.opacity(0.5))
        .reverseMask {
          Rectangle()
            .matchedGeometryEffect(id: "HIGHLIGHTSHAPE", in: animation)
            .frame(width: highlightRect.width + 5, height: highlightRect.height + 5)
            .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius, style: highlight.style))
            .offset(x: highlightRect.minX - 2.5, y: highlightRect.minY + safeAres.top - 2.5)
        }
        .ignoresSafeArea()
        .onTapGesture {
          if currentHighlight >= highlightOrder.count - 1 {
            withAnimation(.easeInOut(duration: 0.25)) {
              showView = false
            }
          } else {
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.7)) {
              currentHighlight += 1
            }
          }
        }
    }
  }
}

extension View {
  @ViewBuilder
  func reverseMask<Content: View>(alignment: Alignment = .topLeading, @ViewBuilder content: @escaping () -> Content) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: .topLeading) {
          content()
            .blendMode(.destinationOut)
        }
    }
  }
}

fileprivate struct HighlightAnchorKey: PreferenceKey {
  static var defaultValue: [Int: Highlight] = [:]

  static func reduce(value: inout [Int : Highlight], nextValue: () -> [Int : Highlight]) {
    value.merge(nextValue()) { $1 }
  }
}

struct ShowcaseHelper: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
