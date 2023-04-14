//
//  DependencyInjector.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 11/03/2023.
//

import Combine
import Foundation
import SwiftUI

typealias Store<V> = CurrentValueSubject<V, Error>

struct DIContainer: EnvironmentKey {

  // MARK: Lifecycle

  init(appState: Store<AppState>, interactors: Interactors) {
    self.appState = appState
    self.interactors = interactors
  }

  init(appState: AppState, interactors: Interactors) {
    self.init(appState: Store<AppState>(appState), interactors: interactors)
  }

  // MARK: Internal

  static var defaultValue: Self { Self.default }

  let appState: Store<AppState>
  let interactors: Interactors

  // MARK: Private

  private static let `default` = Self(appState: AppState(), interactors: .stub)

}

// MARK: DIContainer.Interactors

extension DIContainer {

  struct Interactors {
    static var stub: Self {
      .init(userPermissionsInteractor: StubUserPermissionsInteractor())
    }

    let userPermissionsInteractor: UserPermissionsInteractor

  }

}

protocol UserPermissionsInteractor: AnyObject {
  func resolveStatus(for permission: Permission)
  func request(permission: Permission)
}

enum Permission {
  case pushNotifications
}

final class StubUserPermissionsInteractor: UserPermissionsInteractor {

  func resolveStatus(for _: Permission) {}

  func request(permission _: Permission) {}
}
