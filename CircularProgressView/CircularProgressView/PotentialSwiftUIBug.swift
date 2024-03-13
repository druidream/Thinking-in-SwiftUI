//
//  PotentialSwiftUIBug.swift
//  CircularProgressView
//
//  Created by Jun Gu on 3/4/24.
//

import SwiftUI

/**
 SwiftUI Bug?: CircularProgressViewStyle stuck on indeterminate progress
 https://www.hackingwithswift.com/forums/swiftui/swiftui-bug-circularprogressviewstyle-stuck-on-indeterminate-progress/4843
 have the same issue, could not get CircularProgressViewStyle working

 Working with ProgressView and ProgressViewStyle in SwiftUI
 https://www.appcoda.com/progressview-swiftui/

 [Apple] Displaying progress views and gauges
 https://developer.apple.com/documentation/clockkit/deprecated_articles_and_symbols/displaying_progress_views_and_gauges
 it's for WatchKit and deprecated
*/
struct PotentialSwiftUIBug: View {
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Hello, world!")
			ProgressView(value: 0.4)
//				.progressViewStyle(DefaultProgressViewStyle())
//				.progressViewStyle(LinearProgressViewStyle())
				.progressViewStyle(CircularProgressViewStyle(tint: .green))
		}
		.padding()
	}
}

#Preview {
    PotentialSwiftUIBug()
}
