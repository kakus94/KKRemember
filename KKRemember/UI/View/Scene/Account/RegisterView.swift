//
//  RegisterView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct RegisterView: View {
  var body: some View {
    ScrollView {

      Logo()

      VStack(spacing: 20) {

        EntryTextLabel(
          label: "Email",
          placeholder: "Email",
          value: .constant("")
        )

        EntryTextLabel(
          label: "Name",
          placeholder: "Name",
          value: .constant("")
        )

        EntryTextLabel(
          label: "Password",
          placeholder: "Password",
          value: .constant("")
        )

        EntryTextLabel(
          label: "Repeat password",
          placeholder: "Repeat password",
          value: .constant("")
        )

        ButtonApp(action: {}) {
          TextBody("Register")
            .maxWidth(.center)
        }
        .foregroundColor(.green)

        ButtonApp(action: {}) {
          TextBody("Cancel")
            .maxWidth(.center)
        }
        .foregroundColor(.red)

      }
      .paddingAppDefault()
      .ipadLoginSize
    }
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView()
  }
}
