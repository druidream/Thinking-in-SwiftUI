//
//  RingShape.swift
//  ReverseMaskTest
//
//  Created by Jun Gu on 2023/12/5.
//

import SwiftUI

struct RingShape: View {
  var body: some View {
    Circle()
//      .trim(from: 0.25, to: 0.75)
      .stroke(Color.blue, lineWidth: 10)
      .frame(width: 100, height: 100)
  }
}
