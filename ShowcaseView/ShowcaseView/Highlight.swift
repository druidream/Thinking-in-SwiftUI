//
//  Highlight.swift
//  ShowcaseView
//
//  Created by Jun Gu on 2023/11/18.
//

import SwiftUI

struct Highlight: Identifiable, Equatable {
  var id: UUID = .init()
  var anchor: Anchor<CGRect>
  var title: String
  var cornerRadius: CGFloat
  var style: RoundedCornerStyle = .continuous
  var scale: CGFloat = 1
}
