//
//  RepositoryTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import XCTest
@testable import Westeros

class RepositoryTest: XCTestCase {
    
    var dummyHouse: [House]!
    
    override func setUp() {
        super.setUp()
        dummyHouse = Repository.local.houses
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryExists() {
        let local = Repository.local
        XCTAssertNotNil( local )
    }
    
    func testLocalRepositoryHousesExists() {
        XCTAssertNotNil( dummyHouse )
        XCTAssertEqual( dummyHouse.count, 3 )
    }
    
    func testLocalRepositoryReturnsSortedHouses() {
        XCTAssertEqual( dummyHouse, dummyHouse.sorted() )
    }
    
    func testLocalRepositoryReturnsHousesCaseInsensitive() {
        let stark = Repository.local.house( named:"sTArK" )
        XCTAssertEqual( stark?.name, "Stark" )
    
        let fake = Repository.local.house( named: "fakeHouse" )
        XCTAssertNil( fake )
    }
    
    func testHouseFilter() {
        let filtered = Repository.local.houses( filteredBy: { $0.count == 1 } )
        XCTAssertEqual( filtered.count, 1 )
    }
    
    func testLocalRepositoryReturnsHouseTypesafe() {
        let stark = Repository.local.house( named: .Stark )
        let lannister = Repository.local.house( named: .Lannister )
        
        XCTAssertEqual( stark?.name, "Stark" )
        XCTAssertNotEqual( lannister?.name, "Stark" )
    }
    
}
