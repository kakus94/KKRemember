//
//  ListPage.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 08/04/2023.
//

import SwiftUI

struct ListPageView: View {
    var body: some View {
      ZStack {
        Text("ListPageView")
      }
      .navigationTitle("List")
      .navigationBarTitleDisplayMode(.automatic)
    }
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
      ListPageView()
    }
}
