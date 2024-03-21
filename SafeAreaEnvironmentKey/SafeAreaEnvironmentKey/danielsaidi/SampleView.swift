//
//  SampleView.swift
//  SafeAreaEnvironmentKey
//
//  Created by Jun Gu on 3/21/24.
//

import SwiftUI

struct MyView: View {

    @Environment(\.safeAreaInsets)
    private var insets: EdgeInsets

    var body: some View {
        Text("\(insets.bottom)")
    }
}
