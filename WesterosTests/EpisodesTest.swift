//
//  EpisodesTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import XCTest
@testable import Westeros

var firstEpisode: Episode!
var secondEpisode: Episode!
var firstEpisodeDouble: Episode!
var dateFirstEpisode: Date!
var dateSecondEpisode: Date!
var inputFormatter: DateFormatter!

class EpisodesTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        dateFirstEpisode = inputFormatter.date( from: "01/04/2011" )
        firstEpisode = Episode( title: "Se acerca el invierno", airDate: dateFirstEpisode! )
        dateSecondEpisode = inputFormatter.date( from:"01/04/2012" )
        secondEpisode = Episode( title: "The North Remembers", airDate: dateSecondEpisode! )
        firstEpisodeDouble = Episode( title: "Se acerca el invierno", airDate: dateFirstEpisode! )
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExists() {
        XCTAssertNotNil( firstEpisode )
    }
    
    func testEpisodeEquatable() {
        XCTAssertEqual( firstEpisode, firstEpisode )
        XCTAssertNotEqual( firstEpisode, secondEpisode )
        XCTAssertEqual( firstEpisode, firstEpisodeDouble )
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil( firstEpisode.hashValue )
    }
    func testEpisodeComparable() {
        XCTAssertLessThan( firstEpisode!, secondEpisode! )
    }
    func testEpisodeCustomStringConvertible() {
        XCTAssertEqual( firstEpisode.description, "Se acerca el invierno, 01-04-2011" )
    }
    
}
