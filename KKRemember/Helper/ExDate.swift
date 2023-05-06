//
//  ExDate.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 14/04/2023.
//

import SwiftUI

extension Date {

  func getString(_ formatString: String = "yyyy-MM-dd HH:mm:ss") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatString
    let dateString = dateFormatter.string(from: self)
    return dateString

  }

}
