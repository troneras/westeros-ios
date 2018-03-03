//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by MARIA BLAZQUEZ on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var aria: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        ned = Person(name: "Eddar", alias: "Ned", house: starkHouse)
        aria = Person(name: "Aria",  house: starkHouse)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        XCTAssertNotNil(ned)
        XCTAssertNotNil(aria)
    }
    
    
    func testCharacterFullName() {
        XCTAssertEqual(ned.fullName, "Eddar Stark")
    }
    
    

}
