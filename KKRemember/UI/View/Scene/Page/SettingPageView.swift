//
//  SettingPageView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 08/04/2023.
//

import SwiftUI

struct SettingPageView: View {
    var body: some View {
      NavigationStack {
        List {
          Cell(label: "Pseudomin") {
            EntryText(value: .constant("Szejku"))
          }
          

        }
          .navigationTitle("Setting")
      } 
    }
  
  
  
}


fileprivate struct Cell<Content: View>: View {
  
  var label: String
  @ViewBuilder var content: () -> Content
  
  var body: some View {
    HStack {
      Text(label)
        .maxWidth(.leading)
      content()
    }
  }
}


struct SettingPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPageView()
    }
}
