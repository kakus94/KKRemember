//
//  ReminderItem.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 14/04/2023.
//

import Foundation
import SwiftUI

struct ReminderItem: Identifiable, Decodable, Encodable {

  enum TypeReminder: Decodable, Encodable {
    case wait
    case complite
    case failure

    // MARK: Internal

    var image: Image {
      switch self {
      case .wait:
        return Image(systemName: "clock")
      case .complite:
        return Image(systemName: "checkmark.square.fill")
      case .failure:
        return Image(systemName: "xmark.square.fill")
      }
    }

    var color: Color {
      switch self {
      case .wait:
        return .gray
      case .complite:
        return .green
      case .failure:
        return .red
      }
    }

  }

  var id = UUID().uuidString
  var tittle: String
  var content: String
  var startdate: Date
  var enddate: Date
  var complite: TypeReminder = .wait
  var author: String
}

struct ReminderItems: Decodable, Encodable {
  var items: [ReminderItem] = []
  
  func getSortedItems() -> [ReminderItem] {
    self.items.sorted(by: { $0.startdate < $1.startdate })
  }
}

extension ReminderItem {
  static let mockReminders = [
    ReminderItem(
      tittle: "Buy groceries",
      content: "Remember to get milk and eggs",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "John"
    ),
    ReminderItem(
      tittle: "Pick up dry cleaning",
      content: "Don't forget the blue shirt",
      startdate: Date(),
      enddate: .now,
      complite: .failure,
      author: "Mary"
    ),
    ReminderItem(
      tittle: "Call mom",
      content: "Ask her about her vacation",
      startdate: Date(),
      enddate: .now,
      complite: .wait,
      author: "Bob"
    ),
    ReminderItem(
      tittle: "Finish project",
      content: "Submit by Friday",
      startdate: Date(),
      enddate: .now,
      complite: .wait,
      author: "Alice"
    ),
    ReminderItem(
      tittle: "Pay rent",
      content: "Due on the 15th",
      startdate: Date(),
      enddate: .now,
      complite: .wait,
      author: "John"
    ),
    ReminderItem(
      tittle: "Schedule dentist appointment",
      content: "Check insurance coverage",
      startdate: Date(),
      enddate: .now,
      complite: .wait,
      author: "Mary"
    ),
    ReminderItem(
      tittle: "Buy birthday gift",
      content: "For Jane's 30th",
      startdate: Date(),
      enddate: .now,
      complite: .wait,
      author: "Bob"
    ),
    ReminderItem(
      tittle: "Study for exam",
      content: "Focus on chapter 5",
      startdate: Date(),
      enddate: .now,
      complite: .failure,
      author: "Alice"
    ),
    ReminderItem(
      tittle: "Renew passport",
      content: "Expiration date is approaching",
      startdate: Date(),
      enddate: .now,
      complite: .failure,
      author: "John"
    ),
    ReminderItem(
      tittle: "Book flight tickets",
      content: "For summer vacation",
      startdate: Date(),
      enddate: .now,
      complite: .failure,
      author: "Mary"
    ),
    ReminderItem(
      tittle: "Walk the dog",
      content: "Before 8pm",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "John"
    ),
    ReminderItem(
      tittle: "Submit expense report",
      content: "By end of the week",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Alice"
    ),
    ReminderItem(
      tittle: "Water the plants",
      content: "Twice a week",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Bob"
    ),
    ReminderItem(
      tittle: "Buy new phone",
      content: "Old one is slow",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Mary"
    ),
    ReminderItem(
      tittle: "Go to the gym",
      content: "Three times a week",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "John"
    ),
    ReminderItem(
      tittle: "Attend team meeting",
      content: "Discuss new project",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Alice"
    ),
    ReminderItem(
      tittle: "Clean the house",
      content: "Before guests arrive",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Mary"
    ),
    ReminderItem(
      tittle: "Visit the dentist",
      content: "Checkup and cleaning",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Bob"
    ),
    ReminderItem(
      tittle: "Prepare for presentation",
      content: "Practice delivery",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "Alice"
    ),
    ReminderItem(
      tittle: "Take out the trash",
      content: "Every Tuesday and Friday",
      startdate: Date(),
      enddate: .now,
      complite: .complite,
      author: "John"
    )
  ]

}

extension ReminderItems {

  static func testModel() -> ReminderItems {
    var reminder1 = ReminderItem(
      tittle: "Zadanie 1",
      content: "Opis zadania 1",
      startdate: Date(timeIntervalSince1970: 1_682_890_617),
      enddate: Date(timeIntervalSince1970: 1_682_890_617).addingTimeInterval(3_600),
      complite: .wait,
      author: "Jan Kowalski"
    )
    var reminder2 = ReminderItem(
      tittle: "Zadanie 2",
      content: "Opis zadania 2",
      startdate: Date(timeIntervalSince1970: 1_682_890_617),
      enddate: Date(timeIntervalSince1970: 1_682_890_617).addingTimeInterval(7_200),
      complite: .complite,
      author: "Anna Nowak"
    )
    var reminder3 = ReminderItem(
      tittle: "Zadanie 3",
      content: "Opis zadania 3",
      startdate: Date(timeIntervalSince1970: 1_682_890_617),
      enddate: Date(timeIntervalSince1970: 1_682_890_617).addingTimeInterval(10_800),
      complite: .failure,
      author: "Piotr Wójcik"
    )

    reminder1.id = "A2F979B2-50B1-4852-885F-66248C582F05"
    reminder2.id = "9E8A2CFA-46C7-42E2-AE15-BBA399DB37C1"
    reminder3.id = "9E9BAAFA-238F-46DD-AE20-C26B6728FEE3"

    var result = ReminderItems()
    result.items.append(reminder1)
    result.items.append(reminder2)
    result.items.append(reminder3)

    return result

  }

}
