//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 2/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros
class HouseTests: XCTestCase {
    
    var starkSigil:Sigil!
    var lannisterSigil:Sigil!
    var starkHouse:House!
    var lannisterHouse:House!
    
    var robb: Person!
    var aria:Person!
    var tyrion:Person!
    
    override func setUp() {
        super.setUp()
        lannisterSigil = Sigil(image:UIImage(),description:"Leon Rampante")
        lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Un Lannister siempre paga sus deudas", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
         starkSigil = Sigil(image:UIImage(),description:"Lobo Huargo")
         starkHouse = House(name:"Stark",sigil:starkSigil,words:"Se acerca el invierno",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        robb = Person(name:"Robb",alias:"El Joven Lobo",house:starkHouse);
        aria = Person(name:"Aria",house:starkHouse);
        tyrion = Person(name:"Tyrion",alias:"El enano",house:lannisterHouse);
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouseExistence(){
        XCTAssertNotNil(starkHouse);
        XCTAssertNotNil(lannisterHouse);
    }
    
    
    func testSigilExistence(){
        XCTAssertNotNil(starkSigil);
        XCTAssertNotNil(lannisterSigil);
    }
    
    func testPersonExistence(){
        XCTAssertNotNil(robb)
        XCTAssertEqual(aria.house.name, starkHouse.name)
        
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person:robb);
       
        starkHouse.add(person:robb);
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person:aria);
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person:tyrion);
        XCTAssertEqual(starkHouse.count, 2)
        
        let cersei = Person(name:"Cersei",house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        
        lannisterHouse.add(persons: cersei, jaime)
        XCTAssertEqual(lannisterHouse.count, 2)
        
        
    }
    
    func testHouseEquality(){
        XCTAssertEqual(starkHouse, starkHouse);

        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno",url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!);
        XCTAssertEqual(jinxed, starkHouse)
        XCTAssertNotEqual(starkHouse, lannisterHouse);
    }
    
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    
    func testHouseReturnsSortedArrayOfMembers(){
        starkHouse.add(persons: robb,aria)
        XCTAssertEqual(starkHouse.sortedMembers, [aria,robb])
        
    }
    
    
    
    
    
}
