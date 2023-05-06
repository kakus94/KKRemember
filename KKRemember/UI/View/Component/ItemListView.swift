//
//  ItemListView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 14/04/2023.
//

import SwiftUI

struct ItemListView: View {

  var item: ReminderItem

  var body: some View {
    HStack {

      self.item.complite.image
        .foregroundColor(self.item.complite.color)

      VStack(alignment: .leading) {
        Text(self.item.tittle)
          .font(.body)
          .fontWeight(.heavy)

        Text(self.item.content)
          .font(.caption)
      }
      .maxWidth(.leading)

      VStack {
        Text(self.item.startdate.getString("dd.MM HH:mm"))
          .font(.callout)
        Text(self.item.enddate.getString("dd.MM HH:mm"))
          .font(.callout)
//          Text(item.author)
//            .font(.headline)
      }

    }
  }
}

struct ItemListView_Previews: PreviewProvider {
  static var previews: some View {
    ItemListView(item: ReminderItem.mockReminders.first!)
  }
}
