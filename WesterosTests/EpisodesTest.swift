//
//  EpisodesTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros

var firstEpisode: Episode!
var secondEpisode: Episode!

var fEpisode:Episode!

var dateFirstEpisode: Date!
var dateSecondEpisode: Date!
var inputFormatter: DateFormatter!




class EpisodesTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/mm/yyyy"
        dateFirstEpisode = inputFormatter.date(from:"17/04/2011")
        firstEpisode = Episode(title: "Winter is coming", airDate: dateFirstEpisode!)
        dateSecondEpisode = inputFormatter.date(from:"01/04/2012")
        secondEpisode = Episode(title: "The North Remembers", airDate: dateSecondEpisode!)
        fEpisode = Episode(title: "Winter is coming", airDate: dateFirstEpisode!)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence(){
        XCTAssertNotNil(firstEpisode)
    }
    
    
    func testEpisodeEquality(){
        XCTAssertEqual(firstEpisode, firstEpisode)
        XCTAssertNotEqual(firstEpisode, secondEpisode)
        XCTAssertEqual(firstEpisode, fEpisode)
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(firstEpisode.hashValue)
    }
    func testEpisodeComparison(){
        XCTAssertLessThan(firstEpisode!, secondEpisode!)
    }
    func testEpisodeCustomStringConvertible(){
        XCTAssertEqual(firstEpisode.description, fEpisode.description)
    }
    
    
}
