//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros
class HouseTests: XCTestCase {
    
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
        lannisterHouse = House( name: "Lannister", sigil: lannisterSigil, words: "Escucha mi rugido", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")! )
        starkSigil = Sigil( image: UIImage(),description: "Lobo Huargo" )
        starkHouse = House( name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")! )
        tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse )
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence() {
        XCTAssertNotNil( starkHouse )
        XCTAssertNotNil( lannisterHouse )
    }
    
    
    func testSigilExistence() {
        XCTAssertNotNil( starkSigil )
        XCTAssertNotNil( lannisterSigil )
    }
    
    func testPersonExistence() {
        robb = Person( name: "Robb", alias: "El Joven Lobo", house: starkHouse )
        aria = Person( name: "Aria", house: starkHouse )
        XCTAssertNotNil( robb )
        XCTAssertEqual( aria.house.name, starkHouse.name )
        XCTAssertEqual( starkHouse.count, 2 )
        
        let _ = Person( name: "Cersei", house: lannisterHouse )
        let _ = Person( name: "Jaime", alias: "El matareyes", house: lannisterHouse )

        XCTAssertEqual( lannisterHouse.count, 3 )
    }
    
    func testHouseEquatable() {
        XCTAssertEqual( starkHouse, starkHouse )
        let prueba = House( name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")! )
        XCTAssertEqual( prueba, starkHouse )
        XCTAssertNotEqual( starkHouse, lannisterHouse )
    }
    
    func testHouseHashable() {
        XCTAssertNotNil( starkHouse.hashValue )
    }
    
    func testHouseComparable() {
        XCTAssertLessThan( lannisterHouse, starkHouse )
    }
    
    
    func testHouseReturnsMembersSorted() {
        robb = Person( name: "Robb", alias: "El Joven Lobo", house: starkHouse )
        aria = Person( name: "Aria", house: starkHouse )
        XCTAssertEqual( starkHouse.sortedMembers, [aria,robb] )
    }
    
    
    
    
    
}
