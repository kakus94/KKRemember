//
//  LoginView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct LoginView: View {

  @State var email: String = ""
  @State var password: String = ""
  @State var emailRecovery: String = ""

  @Binding var login: Bool
  
  @State private var registerPresentView: Bool = false
  @State private var showForgotPassword: Bool = false
  
  var body: some View {
    NavigationStack {
      ScrollView {

        Logo()

        VStack(spacing: 20) {
          
          EntryTextLabel(label: "Email", placeholder: "Email", value: self.$email)
          
          EntryTextLabel(label: "Password", placeholder: "Password", value: self.$password)

          ButtonApp(action: { login.toggle() }) {
            TextBody("Login")
              .maxWidth(.center)
          }
          .foregroundColor(.green)

          ButtonApp(action: { registerPresentView = true }) {
            TextBody("I don't have an account")
              .maxWidth(.center)
          }

          ButtonApp(action: { showForgotPassword.toggle() }) {
            TextBody("I forgot my password")
              .maxWidth(.center)
          }

        }
        .paddingAppDefault(.horizontal)
        .ipadLoginSize

      }
      .maxWidth(.center)
      
      .navigationDestination(isPresented: $registerPresentView) {
        RegisterView()
      }
      
      .sheet(isPresented: $showForgotPassword) {
        ForgotPassword(value: $emailRecovery)
          .presentationDetents([ .medium, .large])
          .presentationDragIndicator(.automatic)
    }
    }
  }

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
