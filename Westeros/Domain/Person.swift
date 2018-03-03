//
//  Character.swift
//  Westeros
//
//  Created by MARIA BLAZQUEZ on 3/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//

import Foundation

final class Person{
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        return _alias ?? ""
    }
    
    init (name: String, alias: String, house: House ){
        self.name = name
        _alias = alias
        self.house = house
    }
    
    init (name: String, house: House) {
        self.name = name
        self.house = house
        _alias = nil
    }
    
}

extension Person{
    var fullName: String {
        return "\(name) \(house.name)"
    }
}
