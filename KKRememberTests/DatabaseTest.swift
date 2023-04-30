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
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // Any test you write for XCTest can be annotated as throws and async.
    // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
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
}

