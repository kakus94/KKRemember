//
//  KKRememberApp.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 09/03/2023.
//

import SwiftUI

@main
struct KKRememberApp: App {

  @State var route: NavigationPath = .init()
  @State var loginEnable: Bool = false

  var body: some Scene {
    WindowGroup {
      if !self.loginEnable {
        LoginView(login: self.$loginEnable)
      } else {
        MainView()
      }
    }
  }

}

enum Route: Hashable {
  case login
  case register
}
