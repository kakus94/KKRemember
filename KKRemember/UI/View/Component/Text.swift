//
//  KK_TextBody.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct TextBody: View {

  // MARK: Lifecycle

  init(_ text: String) {
    self.text = text
  }

  // MARK: Internal

  var text: String

  var body: some View {
    Text(self.text)
      .textBodyStyle
  }
}

extension Text {
  var textBodyStyle: some View {
    self
      .font(.body)
      .foregroundColor(.primary)
  }
}

struct TextBody_Previews: PreviewProvider {
  static var previews: some View {
    TextBody("Hello world")
  }
}
