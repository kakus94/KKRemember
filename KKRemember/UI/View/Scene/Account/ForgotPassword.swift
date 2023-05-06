//
//  ForgotPassword.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 14/04/2023.
//

import SwiftUI

struct ForgotPassword: View {

  // MARK: Internal

  @Binding var value: String

  var handler: (() -> Void)?

  var body: some View {
    NavigationStack {
      VStack {
        List {
          Section("Enter the email you used during registration") {
            HStack {

              Text("Email:")

              TextField("", text: self.$value)
                .textFieldStyle(KKTextFieldStyle())
            }
          }

          Section {
            Button(action: { self.handler?() }) {
              Text("Recover password")
                .disabled(self.value.count < 4)
            }
          }

        }

      }
      .navigationBarTitleDisplayMode(.large)
      .navigationTitle("Password recovery")
    }
  }

  // MARK: Private

  @State private var disable: Bool = true
}

struct ForgotPassword_Previews: PreviewProvider {
  static var previews: some View {
    ForgotPassword(value: .constant("aassa@gmail.com"))

  }
}
