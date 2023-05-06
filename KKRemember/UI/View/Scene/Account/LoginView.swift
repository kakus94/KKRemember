//
//  LoginView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct LoginView: View {

  // MARK: Internal

  @State var email: String = ""
  @State var password: String = ""
  @State var emailRecovery: String = ""

  @Binding var login: Bool

  var body: some View {
    NavigationStack {
      ScrollView {

        Logo()

        VStack(spacing: 20) {

          EntryTextLabel(label: "Email", placeholder: "Email", value: self.$email)

          EntryTextLabel(label: "Password", placeholder: "Password", value: self.$password)

          ButtonApp(action: { self.login.toggle() }) {
            TextBody("Login")
              .maxWidth(.center)
          }
          .foregroundColor(.green)

          ButtonApp(action: { self.registerPresentView = true }) {
            TextBody("I don't have an account")
              .maxWidth(.center)
          }

          ButtonApp(action: { self.showForgotPassword.toggle() }) {
            TextBody("I forgot my password")
              .maxWidth(.center)
          }

        }
        .paddingAppDefault(.horizontal)
        .ipadLoginSize

      }
      .maxWidth(.center)

      .navigationDestination(isPresented: self.$registerPresentView) {
        RegisterView()
      }

      .sheet(isPresented: self.$showForgotPassword) {
        ForgotPassword(value: self.$emailRecovery)
          .presentationDetents([.medium, .large])
          .presentationDragIndicator(.automatic)
      }
    }
  }

  // MARK: Private

  @State private var registerPresentView: Bool = false
  @State private var showForgotPassword: Bool = false
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(login: .constant(false))
  }
}

extension View {
  var ipadLoginSize: some View {
    VStack {
      if UIDevice.isIPad {
        self
          .frame(width: 400)
      } else {
        self
      }
    }
  }
}
