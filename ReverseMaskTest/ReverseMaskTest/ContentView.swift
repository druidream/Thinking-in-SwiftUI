//
//  ContentView.swift
//  ReverseMaskTest
//
//  Created by Jun Gu on 2023/12/4.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedIndex = 0
  var body: some View {
    VStack {
      ZStack {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        HStack(spacing: 20) {
          Button {
            withAnimation {
              selectedIndex = 0
            }

          } label: {
            Image(systemName: "house.fill")
              .frame(width: 40)
          }

          Button {
            withAnimation {
              selectedIndex = 1
            }
          } label: {
            Image(systemName: "dice.fill")
              .frame(width: 40)
          }
          Button {
            withAnimation {
              selectedIndex = 2
            }
          } label: {
            Image(systemName: "graduationcap.fill")
              .frame(width: 40)
          }
          Button {
            withAnimation {
              selectedIndex = 3
            }
          } label: {
            Image(systemName: "pin.fill")
              .frame(width: 40)
          }
          Button {
            withAnimation {
              selectedIndex = 4
            }
          } label: {
            Image(systemName: "crown.fill")
              .frame(width: 40)
          }
        }
        .foregroundStyle(.white)
        .frame(width: 300, height: 60)
        .background(.pink)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .mask {
          Rectangle()
            .foregroundStyle(.blue)
            .overlay(alignment: .leading) {
              Circle()
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 60, height: 60)
                .offset(x: CGFloat(60 * selectedIndex))
                .foregroundStyle(.red)
                .blendMode(.destinationOut)
            }
        }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ContentView()
}
