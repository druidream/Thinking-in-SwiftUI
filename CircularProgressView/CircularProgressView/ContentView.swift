//
//  ContentView.swift
//  CircularProgressView
//
//  Created by Jun Gu on 3/4/24.
//

import SwiftUI

/**
 How to create SwiftUI circular progress bar
 https://sarunw.com/posts/swiftui-circular-progress-bar/
 implemented by following this tutorial

 Create a Circular Progress Bar in SwiftUI
 https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/4-create-a-circular-progress-bar-in-swiftui
 pretty much the same implementation from Kodeco
 */
struct ContentView: View {

	@State var progress: Double = 0

	var body: some View {
		VStack {
			Spacer()

			ZStack {
				CircularProgressView(progress: progress)

				Text("\(progress * 100, specifier: "%.0f")")
					.font(.largeTitle)
					.bold()
			}
			.frame(width: 200, height: 200)

			Spacer()

			Slider(value: $progress, in: 0...1)
				.padding(.horizontal)

			Button("Reset") {
				resetProgress()
			}.buttonStyle(.borderedProminent)

			Spacer()
		}
	}

	func resetProgress() {
		progress = 0
	}
}

struct CircularProgressView: View {

	let progress: Double

	var body: some View {
		ZStack {
			Circle()
				.stroke(
					Color.pink.opacity(0.5),
					lineWidth: 30
				)
			Circle()
				.trim(from: 0, to: progress)
				.stroke(
					Color.pink,
					style: StrokeStyle(
						lineWidth: 30,
						lineCap: .round
					)
				)
				.rotationEffect(.degrees(-90))
				.animation(.easeOut, value: progress)
		}
	}
}

#Preview {
	ContentView()
}
