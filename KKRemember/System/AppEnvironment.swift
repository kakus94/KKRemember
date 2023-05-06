//
//  AppEnvironment.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 11/03/2023.
//

import Foundation

struct AppEnvironment {

  var account: Account?
  var listItems: ReminderItems = .init()
  var favoriteItems: ReminderItems = .init()
  var archiveItems: ReminderItems = .init()

}
