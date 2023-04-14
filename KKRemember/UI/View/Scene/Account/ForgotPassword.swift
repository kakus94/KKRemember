//
//  ForgotPassword.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 14/04/2023.
//

import SwiftUI

struct ForgotPassword: View {
  
  @Binding var value: String
  
  var handler: (() -> Void)?
  
  @State private var disable: Bool = true
  
    var body: some View {
      NavigationStack {
        VStack {
          List {
            Section("Enter the email you used during registration") {
              HStack{
                
                Text("Email:")
                
                TextField("", text: $value)
                  .textFieldStyle(KKTextFieldStyle())
              }
            }
            
            Section{
              Button(action: { handler?() }) {
                Text("Recover password")
                  .disabled(value.count < 4)
              }
            }
     
          }
         
        }
        .navigationBarTitleDisplayMode(.large)
      .navigationTitle("Password recovery")
      }
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword(value: .constant("aassa@gmail.com"))
   
    }
}
