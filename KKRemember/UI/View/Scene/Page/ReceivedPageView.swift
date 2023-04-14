//
//  ReceivedPageView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 08/04/2023.
//

import SwiftUI

struct ReceivedPageView: View {
    var body: some View {
      NavigationStack {
        Text("ReceivedPageView")
          .navigationTitle("Received")
      }
    }
}

struct ReceivedPageView_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedPageView()
    }
}
