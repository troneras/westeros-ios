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
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        let character = Person(name: "Eddar", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(character)
    }
    
    func testCharacterExistenceWithoutAlias() {
        let character = Person(name: "Eddar", house: starkHouse)
        XCTAssertNotNil(character)
    }
    
    
    
    

}
