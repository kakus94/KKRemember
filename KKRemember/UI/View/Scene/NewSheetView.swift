//
//  NewSheetView.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 30/04/2023.
//

import SwiftUI

struct NewSheetView: View {
  
  @State private var startDate: Date = .now
  @State private var endDate: Date = .now
  @State private var nameAlert: String = ""
  @State private var bodyContent: String = ""
  
  
  
    var body: some View {
      NavigationView {
        List {
          Section("Date") {
            DatePicker("Start", selection: $startDate, displayedComponents: [.hourAndMinute, .date])
            DatePicker("End", selection: $endDate, displayedComponents: [.hourAndMinute, .date])
          }

          Section("details remenber") {
            EntryTextLabel(label: "Name alert:", placeholder: "Name allert", value: $nameAlert)
            TextField("Body:", text: $bodyContent, axis: .vertical)
          }
        }
        .navigationTitle("New reminder")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Save", role: .cancel, action: { })
          }
          ToolbarItem(placement: .navigationBarLeading) {
            Button("Cancel", role: .cancel, action: { })
              .tint(.red)
          }
        }
      }
    }
}

struct NewSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NewSheetView()
    }
}
