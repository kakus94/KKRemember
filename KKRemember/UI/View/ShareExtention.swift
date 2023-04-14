//
//  ShareExtention.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 28/03/2023.
//

import SwiftUI

let paddingDefault: CGFloat = 15

// MARK: Padding implementation

struct PaddingAppDefault: ViewModifier {

  // MARK: Lifecycle

  init(edge: Edge.Set = .all, size: CGFloat = paddingDefault) {
    self.edge = edge
    self.size = size
  }

  // MARK: Internal

  var edge: Edge.Set
  var size: CGFloat

  func body(content: Content) -> some View {
    content
      .padding(self.edge, self.size)
  }
}

extension View {
  func paddingAppDefault(_ edge: Edge.Set = .all, _ size: CGFloat = paddingDefault) -> some View {
    self
      .modifier(PaddingAppDefault(edge: edge, size: size))
  }
}

// MARK: Frame implementation

struct MaxWidth: ViewModifier {

  var alignment: Alignment

  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, alignment: self.alignment)
  }
}

extension View {
  func maxWidth(_ alignment: Alignment) -> some View {
    self
      .modifier(MaxWidth(alignment: alignment))
  }
}

struct MaxHight: ViewModifier {

  var alignment: Alignment

  func body(content: Content) -> some View {
    content
      .frame(maxHeight: .infinity, alignment: self.alignment)
  }
}

extension View {
  func maxHight(_ alignment: Alignment) -> some View {
    self
      .modifier(MaxWidth(alignment: alignment))
  }
}

// MARK: UIDevice

extension UIDevice {
  static var isIPad: Bool {
    UIDevice.current.userInterfaceIdiom == .pad
  }

  static var isIPhone: Bool {
    UIDevice.current.userInterfaceIdiom == .phone
  }
}

// MARK: Button

struct AppButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .paddingAppDefault(.horizontal)
      .paddingAppDefault(.vertical, 12)
      .background(.quaternary, in: Capsule())
      .opacity(configuration.isPressed ? 0.5 : 1)
  }
}

struct AppButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Button(action: { print("Pressed") }) {
      Label("Press Me", systemImage: "star")
    }
    .buttonStyle(AppButtonStyle())
  }
}

extension Button {
  var appButtonStyle: some View {
    self
      .buttonStyle(AppButtonStyle())
  }
}
