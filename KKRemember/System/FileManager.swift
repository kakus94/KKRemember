//
//  FileManager.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 15/04/2023.
//

import Foundation


actor Database {
  
  static let share: Database = .init()
  
  func save(_ data: Data, type: TypeSave) {
    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let pathWithFileName = documentDirectory.appendingPathComponent(type.url)
      do {
        try data.write(to: pathWithFileName)
      } catch {
        print(error)
      }
    }
  }
  
  func read(type: TypeSave) -> Data? {
    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let pathWithFileName = documentDirectory.appendingPathComponent(type.url)
      do {
        let result = try Data(contentsOf: pathWithFileName)
        return result
      } catch {
        print(error)
      }
    }
    return nil
  }
  
  func savaToFile<T: Decodable>(_ model: T) {
    
  }
  
  enum TypeSave {
    case list, favorite, archive
    
    var url: String {
      switch self {
      case .list:
        return "list.json"
      case .favorite:
        return "favorite.json"
      case .archive:
        return "archive.json"
      }
    }
    
  }
  
}





/*
 
 let jsonString = "{\"location\": \"the moon\"}"

 if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                     in: .userDomainMask).first {
     let pathWithFilename = documentDirectory.appendingPathComponent("myJsonString.json")
     do {
         try jsonString.write(to: pathWithFilename,
                              atomically: true,
                              encoding: .utf8)
     } catch {
         // Handle error
     }
 }
 
 
 */
