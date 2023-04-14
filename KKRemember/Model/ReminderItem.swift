//
//  ReminderItem.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 14/04/2023.
//

import Foundation

struct ReminderItem: Identifiable {
  let id = UUID().uuidString
  var tittle: String
  var content: String
  var date: Date
  var complite: Bool = false
  var author: String
}


extension ReminderItem {
  static let mockReminders = [
    ReminderItem(tittle: "Buy groceries", content: "Remember to get milk and eggs", date: Date(), complite: false, author: "John"),
    ReminderItem(tittle: "Pick up dry cleaning", content: "Don't forget the blue shirt", date: Date(), complite: true, author: "Mary"),
    ReminderItem(tittle: "Call mom", content: "Ask her about her vacation", date: Date(), complite: false, author: "Bob"),
    ReminderItem(tittle: "Finish project", content: "Submit by Friday", date: Date(), complite: false, author: "Alice"),
    ReminderItem(tittle: "Pay rent", content: "Due on the 15th", date: Date(), complite: true, author: "John"),
    ReminderItem(tittle: "Schedule dentist appointment", content: "Check insurance coverage", date: Date(), complite: false, author: "Mary"),
    ReminderItem(tittle: "Buy birthday gift", content: "For Jane's 30th", date: Date(), complite: false, author: "Bob"),
    ReminderItem(tittle: "Study for exam", content: "Focus on chapter 5", date: Date(), complite: false, author: "Alice"),
    ReminderItem(tittle: "Renew passport", content: "Expiration date is approaching", date: Date(), complite: false, author: "John"),
    ReminderItem(tittle: "Book flight tickets", content: "For summer vacation", date: Date(), complite: true, author: "Mary"),
    ReminderItem(tittle: "Walk the dog", content: "Before 8pm", date: Date(), complite: false, author: "John"),
    ReminderItem(tittle: "Submit expense report", content: "By end of the week", date: Date(), complite: false, author: "Alice"),
    ReminderItem(tittle: "Water the plants", content: "Twice a week", date: Date(), complite: false, author: "Bob"),
    ReminderItem(tittle: "Buy new phone", content: "Old one is slow", date: Date(), complite: false, author: "Mary"),
    ReminderItem(tittle: "Go to the gym", content: "Three times a week", date: Date(), complite: false, author: "John"),
    ReminderItem(tittle: "Attend team meeting", content: "Discuss new project", date: Date(), complite: false, author: "Alice"),
    ReminderItem(tittle: "Clean the house", content: "Before guests arrive", date: Date(), complite: false, author: "Mary"),
    ReminderItem(tittle: "Visit the dentist", content: "Checkup and cleaning", date: Date(), complite: false, author: "Bob"),
    ReminderItem(tittle: "Prepare for presentation", content: "Practice delivery", date: Date(), complite: false, author: "Alice"),
    ReminderItem(tittle: "Take out the trash", content: "Every Tuesday and Friday", date: Date(), complite: false, author: "John")
]

}
