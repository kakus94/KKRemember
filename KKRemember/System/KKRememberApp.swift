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
  
  var body: some Scene {
    WindowGroup {
      NavigationStack(path: $route) {
        LoginView()
      }      
    }
  }
}

enum Route: Hashable {
    case login
    case register
}
