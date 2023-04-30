//
//  FileManager.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 15/04/2023.
//

import Foundation


actor Database {
  
  static let share: Database = .init()
  
  private func save(_ data: Data, type: TypeSave) {
    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let pathWithFileName = documentDirectory.appendingPathComponent(type.url)
      do {
        try data.write(to: pathWithFileName)
      } catch {
        print(error)
      }
    }
  }
  
  private func read(type: TypeSave) -> Data? {
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
  
  func savaToFile<T: Encodable>(_ model: T, typeSave: TypeSave) {
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(model) {
      save(data, type: typeSave)
    }
  }
  
  func readFromTheFile<T: Decodable>(_ type: T.Type, typeSave: TypeSave) throws -> T? {
    if let data = read(type: typeSave) {
      let model = try JSONDecoder().decode(T.self, from: data)
      return model
    }
    return nil
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
