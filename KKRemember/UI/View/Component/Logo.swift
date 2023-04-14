//
//  Logo.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct Logo: View {
  var body: some View {
    Image(systemName: "note.text")
      .resizable()
      .frame(width: 100, height: 100)
  }
}

struct Logo_Previews: PreviewProvider {
  static var previews: some View {
    Logo()
  }
}
