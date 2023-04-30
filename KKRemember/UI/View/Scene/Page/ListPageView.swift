//
//  ListPage.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 08/04/2023.
//

import SwiftUI

struct ListPageView: View {
  
  let itemsList = ReminderItem.mockReminders
  
  @State private var showNew: Bool = false
  
    var body: some View {
      NavigationStack {
        List(itemsList.sorted(by: { $0.startdate < $1.startdate })) { item in
          ItemListView(item: item)
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
              
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
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
              
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
        .navigationTitle("List")
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button(action: { showNew = true }) {
              Image(systemName: "plus")
            }
          }
        }
        .sheet(isPresented: $showNew) {
          NewSheetView()
            .presentationDetents([.medium,.large])
        }
      }
      
    }
  
  
  
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
      ListPageView()
    }
}
