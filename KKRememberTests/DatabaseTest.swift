//
//  DatabaseTest.swift
//  KKRememberTests
//
//  Created by Kamil Karpiak on 30/04/2023.
//

import XCTest
@testable import KKRemember

final class DatabaseTest: XCTestCase {
  
  let referenceModel: ReminderItems = .testModel()
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testSaveData() async throws {
    await Database.share.savaToFile(referenceModel, typeSave: .list)
  }
  
  func testReadFromToFile() async throws {
    let model = try await Database.share.readFromTheFile(ReminderItems.self, typeSave: .list)
    XCTAssertEqual(model?.items.count, referenceModel.items.count)
    XCTAssertEqual(model?.items.first?.id, referenceModel.items.first?.id)
    XCTAssertEqual(model?.items.first?.tittle, referenceModel.items.first?.tittle)
    XCTAssertEqual(model?.items.first?.startdate, referenceModel.items.first?.startdate)
    XCTAssertEqual(model?.items.first?.enddate, referenceModel.items.first?.enddate)
  }
  
  func testRemoveFile() async throws {
    //save model
    await Database.share.savaToFile(referenceModel, typeSave: .archive)
    
    //try read model
    let model = try await Database.share.readFromTheFile(ReminderItems.self, typeSave: .archive)
    
    //check id
    XCTAssertEqual(model?.items.first?.id, referenceModel.items.first?.id)
    
    //delate file
    await Database.share.delateFromTheFile(typeSave: .archive)
    
    //try read
    let delateModel = try await Database.share.readFromTheFile(ReminderItems.self, typeSave: .archive)
    
    XCTAssertNil(delateModel)
    
  }
}

