//
//  ContentView.swift
//  NavigationTabsComponent
//
//  Created by Jun Gu on 2023/12/5.
//

import SwiftUI

struct ContentView: View {
  @State var selectedIndex = 0
  var items = ["Hello", "General", "Weekly Session", "Q&A"]
  var body: some View {
    HStack(spacing: 0) {
      ForEach(Array(items.enumerated()), id: \.offset) { index, text in
        TabItem(text: text, isSelected: index == selectedIndex, isFirst: index == 0, isLast: (index == items.count - 1))
          .onTapGesture {
            selectedIndex = index
          }
        if index != items.count - 1 {
          Divider()
        }
      }
    }
    .frame(height: 60)
    .clipShape(RoundedRectangle(cornerRadius: 10))
    .overlay {
      RoundedRectangle(cornerRadius: 10)
        .stroke(.divider, lineWidth: 1)
    }
    .padding()
  }
}

struct TabItem: View {
  var text: String
  var isSelected: Bool
  var isFirst: Bool
  var isLast: Bool

  var body: some View {
    if isSelected {
      ZStack {
        Color.accentColor
        if isFirst {
          Color.BG
            .clipShape(RoundedCorner(radius: 10, corners: [.bottomLeft]))
            .offset(y: -2)
        } else if isLast {
          Color.BG
            .clipShape(RoundedCorner(radius: 10, corners: [.bottomRight]))
            .offset(y: -2)
        } else {
          Color.BG
            .offset(y: -2)
        }
        Text("\(text)")
          .fontWeight(.semibold)
          .foregroundStyle(.accent)
      }
    } else {
      ZStack {
        Color.white
        Text("\(text)")
          .fontWeight(.semibold)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  ContentView()
}
