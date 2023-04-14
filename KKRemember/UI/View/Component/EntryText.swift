//
//  EntryText.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct EntryText: View {

  var placeholder: String = ""
  @Binding var value: String

  var body: some View {
    TextField(self.placeholder, text: self.$value)
      .textFieldStyle(KKTextFieldStyle())

  }
}

struct EntryTextLabel: View {

  // MARK: Lifecycle

  init(label: String, placeholder: String = "", value: Binding<String>) {
    self.label = label
    self.placeholder = placeholder
    self._value = value
  }

  // MARK: Internal

  var label: String
  var placeholder: String
  @Binding var value: String

  var body: some View {
    VStack(spacing: 3) {
      TextBody(self.label)
        .frame(alignment: .leading)
        .maxWidth(.leading)
        .paddingAppDefault(.leading)

      EntryText(placeholder: self.placeholder, value: self.$value)
    }
  }
}

struct EntryText_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      EntryText(placeholder: "placeholder", value: .constant(""))
      EntryText(placeholder: "placeholder", value: .constant("EntryText "))
    }
    .padding()

  }
}

struct KKTextFieldStyle: TextFieldStyle {
  public func _body(configuration field: TextField<_Label>) -> some View {
    field.textFieldStyle(PlainTextFieldStyle())
      .paddingAppDefault(.horizontal)
      .paddingAppDefault([.vertical], 8)
      .background(.gray.opacity(0.1))
      .cornerRadius(20)
  }
}
