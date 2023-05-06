//
//  ReceivedPageView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 08/04/2023.
//

import SwiftUI

struct ReceivedPageView: View {

  @State var items: ReminderItems

  var body: some View {
    NavigationStack {
      List(self.items.items.sorted(by: { $0.startdate < $1.startdate })) { item in
        ItemListView(item: item)
          .swipeActions(edge: .leading, allowsFullSwipe: true) {
            self.swipeActionLeading(item)
          }
          .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            self.swipeActionTraling(item)
          }
      }
      .navigationTitle("Archives")
    }
  }

  @ViewBuilder
  func swipeActionLeading(_ item: ReminderItem) -> some View {
    if item.complite != .complite {
      Button(action: { print("checkmark") }) {
        Image(systemName: "checkmark.square.fill")
      }
      .tint(.green)
    }

    if item.complite != .failure {
      Button(action: { print("xmark") }) {
        Image(systemName: "xmark.square.fill")
      }
      .tint(.red)
    }

    if item.complite != .wait {
      Button(action: { print("wait") }) {
        Image(systemName: "clock")
      }
      .tint(.gray)
    }

    Button(action: { print("star") }) {
      Image(systemName: "star")
    }
    .tint(.yellow)
  }

  @ViewBuilder
  func swipeActionTraling(_: ReminderItem) -> some View {
    Button(action: { print("archivebox") }) {
      Image(systemName: "archivebox")
    }
    .tint(.green)

    Button(action: { print("trash") }) {
      Image(systemName: "trash")
    }
    .tint(.red)
  }

}

struct ReceivedPageView_Previews: PreviewProvider {
  static var previews: some View {
    let model: ReminderItems = .init(items: ReminderItem.mockReminders)
    ReceivedPageView(items: model)
  }
}
