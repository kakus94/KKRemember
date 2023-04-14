//
//  LikePageView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 08/04/2023.
//

import SwiftUI

struct LikePageView: View {
  
  let itemsLike = ReminderItem.mockReminders
  
    var body: some View {
      NavigationStack {
        List(itemsLike) { item in
          ItemListView(item: item)
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
              
              Button(action: { print("archivebox") }) {
                Image(systemName: "archivebox")
              }
              .tint(.green)
              
              Button(action: { print("star") }) {
                Image(systemName: "star")
              }
              .tint(.yellow)            
             
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
              Button(action: { print("trash") }) {
                Image(systemName: "trash")
              }
              .tint(.red)
            }
        }
          .navigationTitle("Like")
      }
    }
}

struct LikePageView_Previews: PreviewProvider {
    static var previews: some View {
        LikePageView()
    }
}
