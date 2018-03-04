//
//  SeasonTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import XCTest
@testable import Westeros

var firstEpisodeFirstSeason: Episode!
var firstSeason: Season!
var firstEpisodeSecondSeason: Episode!
var secondSeason: Season!
var dateFirstSeason: Date!
var dateSecondSeason: Date!
var firstSeasonDouble: Season!

class SeasonTest: XCTestCase {
    
    override func setUp() {
        super.setUp()

        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        dateFirstSeason = inputFormatter.date( from: "01/04/2011" )
        firstEpisodeFirstSeason = Episode( title: "Se acerca el invierno", airDate: dateFirstSeason! )
        firstSeason = Season( name: "Se acerca el invierno", summary: "summary",  releaseDate: dateFirstSeason! )
        firstSeason.add( episode: firstEpisodeFirstSeason )
        dateSecondSeason = inputFormatter.date( from: "01/04/2012")
        firstEpisodeSecondSeason = Episode( title: "The North Remembers", airDate: dateSecondSeason! )
        secondSeason = Season( name: "The North Remembers",  summary: "summary", releaseDate: dateSecondSeason! )
        secondSeason.add( episode: firstEpisodeSecondSeason )
        firstSeasonDouble = Season( name: "Se acerca el invierno", summary: "summary",  releaseDate: dateFirstSeason! )
        firstSeasonDouble.add( episode: firstEpisodeFirstSeason )
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil( firstSeason )
    }
    
    func testSeasonHasEpisode() {
        XCTAssertGreaterThan( firstSeason.count, 0 )
    }
    
    func testSeasonEquatable() {
        XCTAssertEqual( firstSeason, firstSeason )
        XCTAssertNotEqual( firstSeason, secondSeason )
        XCTAssertEqual( firstSeason, firstSeasonDouble )
    }
    
    func testSeasonHashable() {
        XCTAssertNotNil(firstSeason.hashValue)
    }
    func testSeasonComparable(){
        XCTAssertLessThan(firstSeason!, secondSeason!)
    }
    
    func testSeasonCustomStringConvertible() {
        XCTAssertEqual( firstSeason.description, "Se acerca el invierno, 01-04-2011, 1" )
    }

    
}
