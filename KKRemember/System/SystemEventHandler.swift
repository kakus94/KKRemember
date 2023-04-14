//
//  SystemEventHandler.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 11/03/2023.
//

import Foundation

protocol SystemEventHandler {}

struct RealSystemEventHandler: SystemEventHandler {
  let container: DIContainer

}
