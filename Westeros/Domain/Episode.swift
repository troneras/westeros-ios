//
//  Episode.swift
//  Westeros
//
//  Created by Antonio Blázquez on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import Foundation

//MARK: - class
final class Episode{
    
    let title: String
    let airDate:Date
    weak var season: Season?
    
    init(title:String, airDate:Date) {
        self.title = title
        self.airDate = airDate
        
    }
  
}

extension Episode{
    var stringDate:String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: airDate)
    }
}


extension Episode: CustomStringConvertible{
    var description: String {
        return "\(title), \(stringDate)"
    }
    
}


//MARK: - Hashable
extension Episode:Hashable{
    var hashValue: Int{
        return proxyForEquiality.hashValue
    }
}

//MARK: - Proxy
extension Episode{
    var proxyForEquiality: String{
        return "\(title) \(stringDate)"
    }
    var proxyForComparison: Date{
        return airDate
    }
}

//MARK: - Equatable
extension Episode: Equatable{
    static func ==(lhs:Episode, rhs:Episode)->Bool{
        return lhs.proxyForEquiality == rhs.proxyForEquiality
    }
}

//MARK:-Comparable
extension Episode: Comparable{
    static func <(lhs:Episode,rhs:Episode)->Bool{
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

