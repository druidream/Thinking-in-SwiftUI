//
//  ContentView.swift
//  SafeAreaEnvironmentKey
//
//  Created by Jun Gu on 3/21/24.
//

import SwiftUI

struct ContentView: View {

    // either of them works
//    @Environment(\.safeAreaInsets) private var safeAreaInsets
    @Environment(\.anotherSafeAreaInsets) private var safeAreaInsets

    var body: some View {
        VStack {
            Color.green
                .frame(height: safeAreaInsets.top)

            Spacer()

            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(safeAreaInsets)")

            Spacer()

            Color.green
                .frame(height: safeAreaInsets.bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

