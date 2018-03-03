//
//  HousesTests.swift
//  WesterosTests
//
//  Created by MARIA BLAZQUEZ on 2/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros

class HousesTests: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    
    var lannisterHouse: House!
    var lannisterSigil: Sigil!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        starkSigil = Sigil(image:   UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image:   UIImage(), description: "León Rampante")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        lannisterHouse = House(name: "Lannister", sigil: starkSigil, words: "Oye mi rugido")
        robb = Person(name: "Robb", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya",  house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouse_Existence() {
        XCTAssertNotNil(starkHouse)
        XCTAssertNotNil(lannisterHouse)
    }
    
    func testSigilExistence() {
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons() {
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.addPerson(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.addPerson(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.addPerson(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.addPerson(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
    }
    
    
}
