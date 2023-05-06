//
//  FileManager.swift
//  KKRemember
//
//  Created by Kamil Karpiak on 15/04/2023.
//

import Foundation

actor Database {

  // MARK: Internal

  enum TypeSave {
    case list
    case favorite
    case archive

    // MARK: Internal

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

  static let share: Database = .init()

  func delateFromTheFile(typeSave: TypeSave) {
    self.delate(type: typeSave)
  }

  func savaToFile<T: Encodable>(_ model: T, typeSave: TypeSave) {
    let encoder = JSONEncoder()
    if let data = try? encoder.encode(model) {
      self.save(data, type: typeSave)
    }
  }

  func readFromTheFile<T: Decodable>(_: T.Type, typeSave: TypeSave) throws -> T? {
    if let data = read(type: typeSave) {
      let model = try JSONDecoder().decode(T.self, from: data)
      return model
    }
    return nil
  }

  // MARK: Private

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
}
