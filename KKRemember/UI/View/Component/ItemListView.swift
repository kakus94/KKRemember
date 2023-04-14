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
        VStack(alignment: .leading) {
          Text(item.tittle)
            .font(.body)
            .fontWeight(.heavy)
          
          Text(item.content)
            .font(.caption)
        }
        .maxWidth(.leading)
        
        VStack{
          Text(item.date.getString("dd.MM HH:mm"))
            .font(.callout)
          Text(item.author)
            .font(.headline)
        }
        
      }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
      ItemListView(item: ReminderItem.mockReminders.first!)
    }
}