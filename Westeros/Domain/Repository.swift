//
//  Repository.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved
//

import Foundation
var inputFormatter: DateFormatter!
enum Houses: String {
    case Stark = "Stark"
    case Lannister = "Lannister"
    case Targaryen = "Targaryen"
}

final class Repository {
    static let local = LocalFactory()
}
protocol SeasonFactory {
    typealias FilterSeason = (Season) -> Bool
    var seasons: [Season] { get }
    func seasons( filteredBy: FilterSeason ) -> [Season]
}
protocol HouseFactory {
    typealias FilterHouse = (House) -> Bool
    
    var houses: [House] { get }
    func house( named: String ) -> House?
    func house ( named name: Houses ) -> House?
    func houses( filteredBy: FilterHouse )->[House]
}

final class LocalFactory{}

//MARK: - SeasonFactory
extension LocalFactory: SeasonFactory{
    var seasons: [Season] {
        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd-MM-yyyy"
        
        //MARK: - First season
        let fsRelaseDate = inputFormatter.date( from: "17-04-2011" )
        let fsFirstEpisode = Episode(title: "Se acerca el invierno", airDate: fsRelaseDate! )
        let fsSecondEpisode = Episode(title: "El camino Real", airDate: inputFormatter.date( from: "24-04-2011" )! )
        let firstS = Season(name: "Primera Temporada", summary: "Resumen de la temporada" ,releaseDate:fsRelaseDate! )
        firstS.add(episode: fsFirstEpisode)
        firstS.add(episode: fsSecondEpisode)
        
        //MARK: - Second season
        let ssRelaseDate = inputFormatter.date( from: "01-04-2012" )
        let ssFirstEpisode = Episode(title: "El norte recuerda", airDate: ssRelaseDate! )
        let ssSecondEpisode = Episode(title: "The Night Lands", airDate: inputFormatter.date( from: "08-04-2012" )! )
        let secondS = Season(name: "Segunda Temporada", summary: "Resumen de la temporada", releaseDate:ssRelaseDate! )
        secondS.add(episode:ssFirstEpisode)
        secondS.add(episode: ssSecondEpisode)
        
        //MARK: - Third season
        let tsRelaseDate = inputFormatter.date( from: "31-03-2013" )
        let tsFirstEpisode = Episode(title: "Valar Dohaeris", airDate: tsRelaseDate! )
        let tsSecondEpisode = Episode(title: "Dark Wings, Dark Words", airDate: inputFormatter.date( from: "07-04-2013" )! )
        let thirdS = Season(name: "Tercera Temporada", summary: "Resumen de la temporada", releaseDate:tsRelaseDate! )
        thirdS.add(episode: tsFirstEpisode)
        thirdS.add(episode: tsSecondEpisode)
        
        //MARK: - Fourth season
        let fourthsRelaseDate = inputFormatter.date( from: "06-04-2014" )
        let fourthsFirstEpisode = Episode(title: "Two Swords", airDate: fsRelaseDate! )
        let fourthsSecondEpisode = Episode(title: "The Lion and the Rose", airDate: inputFormatter.date( from: "13-04-2014" )! )
        let fourthS = Season(name: "Cuarta Temporada", summary: "Resumen de la temporada", releaseDate: fourthsRelaseDate! )
        fourthS.add(episode: fourthsFirstEpisode)
        fourthS.add(episode: fourthsSecondEpisode)
        
        //MARK: - Fifth season
        let fisRelaseDate = inputFormatter.date( from: "12-04-2015" )
        let fisFirstEpisode = Episode(title: "The Wars to Come", airDate: fisRelaseDate! )
        let fisSecondEpisode = Episode(title: "The House of Black and White", airDate: inputFormatter.date( from: "19-04-2015" )! )
        let fifthS = Season(name: "Quinta Temporada", summary: "Resumen de la temporada", releaseDate:fisRelaseDate! )
        fifthS.add(episode: fisFirstEpisode)
        fifthS.add(episode: fisSecondEpisode)
        
        //MARK: - Sixth season
        let sixsRelaseDate = inputFormatter.date( from: "24-04-2016" )
        let sixsFirstEpisode = Episode(title: "The Red Woman", airDate: sixsRelaseDate! )
        let sixsSecondEpisode = Episode(title: "Home", airDate: inputFormatter.date( from: "01-05-2016" )! )
        let sixthS = Season(name: "Sexta Temporada", summary: "Resumen de la temporada", releaseDate:sixsRelaseDate! )
        sixthS.add(episode: sixsFirstEpisode)
        sixthS.add(episode: sixsSecondEpisode)
        
        //MARK: - Seventh season
        let sevsRelaseDate = inputFormatter.date( from: "16-07-2017" )
        let sevsFirstEpisode = Episode(title: "Dragonstone", airDate: sevsRelaseDate! )
        let sevsSecondEpisode = Episode(title: "Stormborn", airDate: inputFormatter.date( from: "23-07-2017" )! )
        let seventhS = Season(name: "Séptima temporada", summary: "Resumen de la temporada", releaseDate:sevsRelaseDate! )
        seventhS.add(episode: sevsFirstEpisode)
        seventhS.add(episode: sevsSecondEpisode)
        
        return [firstS,secondS,thirdS,fourthS,fifthS,sixthS,seventhS]
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}

//MARK: - HouseFactory
extension LocalFactory: HouseFactory {
    
    var houses: [House] {
        //Houses creation
        let lannisterSigil = Sigil(image:#imageLiteral(resourceName: "lannister.jpg" ),description: "Leon Rampante")
        let lannisterHouse = House(name: "Lannister",sigil:lannisterSigil,words: "Un Lannister siempre paga sus deudas", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")! )
        let  starkSigil = Sigil(image:#imageLiteral(resourceName: "codeIsComing.png"),description: "Lobo Huargo")
        let  starkHouse = House(name: "Stark",sigil:starkSigil,words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragon tricefalo")
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")! )
        
        let _ = Person(name: "Robb",alias: "El Joven Lobo",house:starkHouse);
        let _ =  Person(name: "Aria",house:starkHouse);
        
        let _ = Person(name: "Tyrion",alias: "El enano",house:lannisterHouse);
        let _ = Person(name: "Cersei",house: lannisterHouse)
        let _ = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        
        let _ = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        return [ starkHouse, lannisterHouse, targaryenHouse ].sorted()
    }
    func house(named name: String) -> House? {
        let house = houses.first{ $0.name.uppercased() == name.uppercased() }
        return house
    }
    func house ( named name: Houses ) -> House? {
        let house = houses.first { $0.name.uppercased() == name.rawValue.uppercased() }
        return house
    }
    func houses( filteredBy: FilterHouse ) -> [House] {
        return houses.filter( filteredBy )
    }
    
}

