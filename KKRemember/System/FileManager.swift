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
        print(error.localizedDescription)
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
        print(error.localizedDescription)
      }
    }
    return nil
  }
  
  private func delate(type: TypeSave) {
    if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let pathWithFileName = documentDirectory.appendingPathComponent(type.url)
      do {
        try FileManager.default.removeItem(at: pathWithFileName)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func delateFromTheFile(typeSave: TypeSave){
    delate(type: typeSave)
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

