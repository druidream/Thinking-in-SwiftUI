//
//  Home.swift
//  ShowcaseView
//
//  Created by Jun Gu on 2023/11/18.
//

import SwiftUI
import MapKit

struct Home: View {
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090),
    latitudinalMeters: 1000,
    longitudinalMeters: 1000
  )

  var body: some View {
    TabView {
      GeometryReader {
        let safeArea = $0.safeAreaInsets
        Map(coordinateRegion: $region)
          .overlay(alignment: .top, content: {
            Rectangle()
              .fill(.ultraThinMaterial)
              .frame(height: safeArea.top)
          })
          .ignoresSafeArea()
          .overlay(alignment: .topTrailing) {
            VStack {
              Button {

              } label: {
                Image(systemName: "location.fill")
                  .foregroundStyle(.white)
                  .padding(10)
                  .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                      .fill(.black)
                  }
              }
              .showCase(
                order: 0,
                title: "My Current Location",
                cornerRadius: 10,
                style: .continuous
              )
              
              Spacer()
              
              Button {

              } label: {
                Image(systemName: "suit.heart.fill")
                  .foregroundStyle(.white)
                  .padding(10)
                  .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                      .fill(.red)
                  }
              }
              .showCase(
                order: 1,
                title: "My Current Location",
                cornerRadius: 10,
                style: .continuous
              )
            }
            .padding(15)
          }
      }
      .tabItem {
        Image(systemName: "macbook.and.iphone")
        Text("Devices")
      }
      .toolbarBackground(.visible, for: .tabBar)

      Text("")
        .tabItem {
          Image(systemName: "square.grid.2x2.fill")
          Text("Items")
        }

      Text("")
        .tabItem {
          Image(systemName: "square.grid.2x2.fill")
          Text("Items")
        }
    }
    .overlay(alignment: .bottom, content: {
      HStack(spacing: 0) {
        Circle()
          .foregroundColor(.clear)
          .frame(width: 45, height: 45)
          .showCase(
            order: 2,
            title: "My Current Location",
            cornerRadius: 10,
            style: .continuous
          )
          .frame(maxWidth: .infinity)
        Circle()
          .foregroundColor(.clear)
          .frame(width: 45, height: 45)
          .showCase(
            order: 4,
            title: "My Current Location",
            cornerRadius: 10,
            style: .continuous
          )
          .frame(maxWidth: .infinity)
        Circle()
          .foregroundColor(.clear)
          .frame(width: 45, height: 45)
          .showCase(
            order: 3,
            title: "My Current Location",
            cornerRadius: 10,
            style: .continuous
          )
          .frame(maxWidth: .infinity)
      }
      .allowsHitTesting(false)
    })
    .modifier(ShowcaseRoot(showHighlights: true, onFinished: {
      print("Finished OnBoarding")
    }))
  }
}

#Preview {
  Home()
}
