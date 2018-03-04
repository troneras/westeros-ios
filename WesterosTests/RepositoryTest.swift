//
//  RepositoryTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    
    var localHouse: [House]!
    override func setUp() {
        super.setUp()
        localHouse = Repository.local.houses
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        let local = Repository.local
        XCTAssertNotNil(local)
        
    }
    
    func testLocalRepositoryHousesCreation(){
       
        XCTAssertNotNil(localHouse)
        XCTAssertEqual(localHouse.count, 3)
    }
    
    func testLocalRepositoryReturnSortedArrayOfHouses(){
        XCTAssertEqual(localHouse, localHouse.sorted())
    }
    
    func testLocalRepositoryReturnHousesByCaseInsensitively(){
        let stark = Repository.local.house(named:"sTaRk");
        XCTAssertEqual(stark?.name, "Stark")
    
        let keepcoding = Repository.local.house(named: "PANCHO");
        XCTAssertNil(keepcoding);
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
    }
    
}
