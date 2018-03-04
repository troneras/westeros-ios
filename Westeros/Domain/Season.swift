//
//  Season.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import UIKit

//MARK: - Typealisas
typealias Episodes = Set<Episode>

//MARK: - Class
final class Season{
    
    let name: String
    let summary: String
    let releaseDate:Date
    private var _episodes: Episodes
    
    init(name: String, summary: String, releaseDate: Date) {
        self.name = name
        self.summary = summary
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
}


extension Season{
    func add(episode:Episode){
        _episodes.insert(episode)
    }
    var stringDate:String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: releaseDate)
    }
    var sortedEpisodes: [Episode]{
        return _episodes.sorted()
    }
    var count:Int{
        return _episodes.count
    }
}

//MARK: - CustomStringConvertible
extension Season: CustomStringConvertible{
    var description: String {
        return "\(name), \(stringDate), \(_episodes.count)"
    }
}

//MARK: - Hashable
extension Season:Hashable{
    var hashValue: Int{
        return proxyForEquiality.hashValue
    }
}

//MARK: - Proxy
extension Season{
    var proxyForEquiality: String{
        return "\(name) \(releaseDate)"
    }
    
    var proxyForComparison: Date{
        return releaseDate
    }
}

//MARK: - Equatable
extension Season: Equatable{
    static func ==(lhs:Season, rhs:Season)->Bool{
        return lhs.proxyForEquiality == rhs.proxyForEquiality
    }
}

//MARK:-Comparable
extension Season: Comparable{
    static func <(lhs:Season,rhs:Season)->Bool{
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

