//
//  ButtonApp.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 28/03/2023.
//

import SwiftUI

struct ButtonApp<Content: View>: View {

  // MARK: Lifecycle

  init(action: @escaping () -> Void, content: @escaping () -> Content) {
    self.action = action
    self.content = content
  }

  // MARK: Internal

  var action: () -> Void
  @ViewBuilder var content: () -> Content

  var body: some View {
    Button(action: self.action) {
      self.content()
    }
    .appButtonStyle
  }
}

struct ButtonApp_Previews: PreviewProvider {
  static var previews: some View {
    ButtonApp(action: {}) {
      Text("Buton layout")
    }
  }
}
