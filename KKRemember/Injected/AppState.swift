//
//  AppStage.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 11/03/2023.
//

import Combine
import Foundation
import SwiftUI

class AppState: ObservableObject {

  // MARK: Lifecycle

  init() {
    DispatchQueue.main.async {
      self.appEnvironment.account = .init(name: "Szejku")
      Task {
        do {
          self.appEnvironment.listItems = try await Database.share
            .readFromTheFile(ReminderItems.self, typeSave: .list) ?? .init()
          self.appEnvironment.archiveItems = try await Database.share.readFromTheFile(
            ReminderItems.self,
            typeSave: .archive
          ) ?? .init()
          self.appEnvironment.favoriteItems = try await Database.share.readFromTheFile(
            ReminderItems.self,
            typeSave: .favorite
          ) ?? .init()
        } catch {}

      }
    }
  }

  // MARK: Internal

  var appEnvironment: AppEnvironment = .init()

  @Published var route: NavigationPath = .init()
  @Published var isLogin: Bool = false
}

extension AppState {}
