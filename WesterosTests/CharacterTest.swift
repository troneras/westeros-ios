//
//  CharacterTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros
class CharacterTest: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var aria: Person!
    var tyrion: Person!
    
    override func setUp() {
        super.setUp()
        lannisterSigil = Sigil( image: UIImage(), description: "Leon Rampante" )
        lannisterHouse = House( name: "Lannister", sigil: lannisterSigil, words: "Un Lannister siempre paga sus deudas", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")! )
        starkSigil = Sigil( image: UIImage(), description: "Lobo Huargo" )
        starkHouse = House( name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")! )
        robb = Person( name: "Robb", alias: "El Joven Lobo", house:starkHouse )
        aria = Person( name: "Aria", house:starkHouse )
        tyrion = Person( name: "Tyrion", alias: "El enano", house:lannisterHouse )
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterExistence() {
        XCTAssertNotNil( robb )
        XCTAssertNotNil( aria)
    }
    func testFullName() {
        XCTAssertEqual( robb.fullName, "Robb Stark" )
    }
 
    func testPersonEquality() {
        XCTAssertEqual( tyrion, tyrion )
        let elEnano = Person( name: "Tyrion", alias: "El enano", house: lannisterHouse )
        XCTAssertEqual( elEnano, tyrion )
        XCTAssertNotEqual( tyrion, aria )
    }
    
}
