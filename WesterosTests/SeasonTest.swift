//
//  SeasonTest.swift
//  WesterosTests
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import XCTest
@testable import Westeros

var firstEpisodeFirstSeason: Episode!
var firstSeason: Season!
var firstEpisodeSecondSeason: Episode!
var secondSeason: Season!
var dateFirstSeason: Date!
var dateSecondSeason: Date!
var fSeason: Season!


class SeasonTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/mm/yyyy"
        dateFirstSeason = inputFormatter.date(from:"17/04/2011")
        firstEpisodeFirstSeason = Episode(title:"Winter Is Coming", airDate: dateFirstSeason!)
        firstSeason = Season(name:"Winter Is Coming",releaseDate:dateFirstSeason!,episode: firstEpisodeFirstSeason)
        dateSecondSeason = inputFormatter.date(from:"01/04/2012")
        firstEpisodeSecondSeason = Episode(title: "The North Remembers", airDate: dateSecondSeason!)
        secondSeason = Season(name: "The North Remembers", releaseDate: dateSecondSeason!, episode: firstEpisodeSecondSeason)
        fSeason = Season(name:"Winter Is Coming",releaseDate:dateFirstSeason!,episode: firstEpisodeFirstSeason)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonExistence(){
        XCTAssertNotNil(firstSeason);
    }
    
    func testSeasonHasEpisode(){
        XCTAssertGreaterThan(firstSeason.count, 0 )
    }
    
    func testSeasonEquality(){
        XCTAssertEqual(firstSeason, firstSeason)
        XCTAssertNotEqual(firstSeason, secondSeason)
        XCTAssertEqual(firstSeason, fSeason)
    }
    
    func testSeasonHashable(){
        XCTAssertNotNil(firstSeason.hashValue)
    }
    func testSeasonComparison(){
        XCTAssertLessThan(firstSeason!, secondSeason!)
    }
    
    func testSeasonCustomStringConvertible(){
        XCTAssertEqual(firstSeason.description, fSeason.description)
    }

    
}
