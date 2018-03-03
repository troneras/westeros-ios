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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHouse_Existence() {
        //given
        //when
        //then
        let starkSigil = Sigil(image:   UIImage(), description: "Lobo Huargo")
        let stark = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        XCTAssertNotNil(stark)
        
        
    }
    
    func testSigilExistence() {
        let starkSigil = Sigil(image:   UIImage(), description: "Lobo Huargo")
        XCTAssertNotNil(starkSigil)
        
        let lanisterSigil = Sigil(image:   UIImage(), description: "León Rampante")
        XCTAssertNotNil(lanisterSigil)
    }
}
