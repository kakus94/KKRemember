//
//  MainView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 23/03/2023.
//

import SwiftUI

struct MainView: View {

  // MARK: Internal

  enum Selection: Hashable {
    case page1
    case page2
    case page3
    case page4

    // MARK: Internal

    func getNaviTitle() -> String {
      switch self {

      case .page1:
        return "List"
      case .page2:
        return "Like"
      case .page3:
        return "Received"
      case .page4:
        return "Setting"
      }
    }
  }

  var body: some View {

    TabView(selection: self.$selection) {
      ListPageView()
        .id(Selection.page1)
        .tabItem {
          Label("List", systemImage: "list.bullet.rectangle")
        }

      LikePageView()
        .id(Selection.page2)
        .tabItem {
          Label("Favorite", systemImage: "star")
        }

      ReceivedPageView()
        .id(Selection.page3)
        .tabItem {
          Label("Archive", systemImage: "tray.and.arrow.down.fill")
        }

      SettingPageView()
        .id(Selection.page4)
        .tabItem {
          Label("Setting", systemImage: "gear")
        }

    }
//      .navigationTitle(selection.getNaviTitle())
//    .navigationBarTitleDisplayMode(.automatic)
//    }
  }

  // MARK: Private

  @State private var selection: Selection = .page1
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
