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
        Text("Setting page")
          .navigationTitle("Setting")
      } 
    }
}

struct SettingPageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPageView()
    }
}
