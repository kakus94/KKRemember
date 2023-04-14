//
//  TestingView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 09/03/2023.
//

import SwiftUI

struct TestingView: View {
  var body: some View {
    List {
      Text("sda")
    }
    .navigationBarTitleDisplayMode(.automatic)
    .navigationTitle("Wszystkie")
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button(action: {}) {
          Text("Menu")
        }
      }
    }
  }
}

struct TestingView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      TestingView()
    }

  }
}
