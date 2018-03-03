//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by MARIA BLAZQUEZ on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros

class CharacterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        let character = Character()
        XCTAssertNotNil(character)
    }

    
}
