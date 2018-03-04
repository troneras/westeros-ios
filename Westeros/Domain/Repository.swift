//
//  Repository.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import Foundation
var inputFormatter: DateFormatter!

final class Repository {
    static let local = LocalFactory()
    
  
}
protocol SeasonFactory {
    typealias FilterSeason = (Season) ->Bool
    var seasons: [Season]{ get }
    func seasons(filteredBy:FilterSeason)->[Season]
}
protocol HouseFactory {
    typealias FilterHouse = (House) ->Bool
    var houses: [House]{ get }
    func house(named: String)->House?
    func houses(filteredBy:FilterHouse)->[House]
}

final class LocalFactory{}

//MARK: - SeasonFactory
extension LocalFactory:SeasonFactory{
    var seasons: [Season] {
        inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd-MM-yyyy"
      
      //MARK: - First season
        let releaseDateFirstS = inputFormatter.date(from: "17-04-2011")
      
        let firstEFirstS = Episode(title:"Winter Is Coming", airDate: releaseDateFirstS!)
        let secondEFirstS = Episode(title:"The Kingsroad", airDate: inputFormatter.date(from:"24-04-2011")!)
        
        let firstS = Season(name:"First Season",releaseDate:releaseDateFirstS!,episode: firstEFirstS)
        firstS.add(episode: secondEFirstS)
    
        
        //MARK: - Second season
        let releaseDateSecondS = inputFormatter.date(from: "01-04-2012")
        
        let firstESecondS = Episode(title:"The North Remembers", airDate: releaseDateSecondS!)
        let secondESecondS = Episode(title:"The Night Lands", airDate: inputFormatter.date(from:"08-04-2012")!)
        
        let secondS = Season(name:"Second Season",releaseDate:releaseDateSecondS!,episode: firstESecondS)
        secondS.add(episode: secondESecondS)
        
        
         //MARK: - Third season
        let releaseDateThirdS = inputFormatter.date(from: "31-03-2013")
        
        let firstEThirdS = Episode(title:"Valar Dohaeris", airDate: releaseDateThirdS!)
        let secondEThirdS = Episode(title:"Dark Wings, Dark Words", airDate: inputFormatter.date(from:"07-04-2013")!)
        
        let thirdS = Season(name:"Third Season",releaseDate:releaseDateThirdS!,episode: firstEThirdS)
        thirdS.add(episode: secondEThirdS)
        
        
        //MARK: - Fourth season
        let releaseDateFourthS = inputFormatter.date(from: "06-04-2014")
        
        let firstEFourthS = Episode(title:"Two Swords", airDate: releaseDateFourthS!)
        let secondEFourthS = Episode(title:"The Lion and the Rose", airDate: inputFormatter.date(from:"13-04-2014")!)
        
        let fourthS = Season(name:"Fourth Season",releaseDate:releaseDateFourthS!,episode: firstEFourthS)
        fourthS.add(episode: secondEFourthS)
        
        
        //MARK: - Fifth season
        let releaseDateFifthS = inputFormatter.date(from: "12-04-2015")
        
        let firstEFifthS = Episode(title:"The Wars to Come", airDate: releaseDateFifthS!)
        let secondEFifthS = Episode(title:"The House of Black and White", airDate: inputFormatter.date(from:"19-04-2015")!)
        
        let fifthS = Season(name:"Fifth Season",releaseDate:releaseDateFifthS!,episode: firstEFifthS)
        fifthS.add(episode: secondEFifthS)
        
        
        //MARK: - Sixth season
        let releaseDateSixthS = inputFormatter.date(from: "24-04-2016")
        
        let firstESixthS = Episode(title:"The Red Woman", airDate: releaseDateSixthS!)
        let secondESixthS = Episode(title:"Home", airDate: inputFormatter.date(from:"01-05-2016")!)
        
        let sixthS = Season(name:"Sixth Season",releaseDate:releaseDateSixthS!,episode: firstESixthS)
        sixthS.add(episode: secondESixthS)
        
        
        //MARK: - Seventh season
        let releaseDateSeventhS = inputFormatter.date(from: "16-07-2017")
        
        let firstESeventhS = Episode(title:"Dragonstone", airDate: releaseDateSeventhS!)
        let secondESeventhS = Episode(title:"Stormborn", airDate: inputFormatter.date(from:"23-07-2017")!)
        
        let seventhS = Season(name:"Seventh Season",releaseDate:releaseDateSeventhS!,episode: firstESeventhS)
        seventhS.add(episode: secondESeventhS)
        
        return [firstS,secondS,thirdS,fourthS,fifthS,sixthS,seventhS]
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        return seasons.filter(filteredBy)
    }
}
//MARK: - HouseFactory
extension LocalFactory: HouseFactory{
 
    var houses: [House]{
       //Houses creation 
        let lannisterSigil = Sigil(image:#imageLiteral(resourceName: "lannister.jpg"),description:"Leon Rampante")
        let lannisterHouse = House(name:"Lannister",sigil:lannisterSigil,words:"Un Lannister siempre paga sus deudas", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let  starkSigil = Sigil(image:#imageLiteral(resourceName: "codeIsComing.png"),description:"Lobo Huargo")
        let  starkHouse = House(name:"Stark",sigil:starkSigil,words:"Se acerca el invierno", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Stark")!)
        
        let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Dragon tricefalo")
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y sangre", url: URL(string:"https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name:"Robb",alias:"El Joven Lobo",house:starkHouse);
        let aria = Person(name:"Aria",house:starkHouse);
        
        let tyrion = Person(name:"Tyrion",alias:"El enano",house:lannisterHouse);
        let cersei = Person(name:"Cersei",house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        
        starkHouse.add(person:aria)
        starkHouse.add(person:robb)
        
        lannisterHouse.add(person:tyrion)
        lannisterHouse.add(person:cersei)
        lannisterHouse.add(person:jaime)
        
        targaryenHouse.add(person: dani)
        
        
        return [starkHouse,lannisterHouse,targaryenHouse].sorted()
    }
    func house(named name: String) -> House? {
      
        let house = houses.first{$0.name.uppercased() == name.uppercased()}
        return house
    }
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
    
}
