//
//  KKRememberApp.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 09/03/2023.
//

import SwiftUI

@main
struct KKRememberApp: App {

  @StateObject var appState: AppState = .init()

  var body: some Scene {
    WindowGroup {
      if !self.appState.isLogin {
        LoginView()
          .environmentObject(self.appState)
      } else {
        MainView()
          .environmentObject(self.appState)
      }
    }

  }

}

enum Route: Hashable {
  case login
  case register
}
