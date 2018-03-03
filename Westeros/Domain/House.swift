//
//  House.swift
//  Westeros
//
//  Created by MARIA BLAZQUEZ on 2/3/18.
//  Copyright © 2018 Antonio Blázquez. All rights reserved.
//
import UIKit

typealias Words = String
typealias Members = Set<Person>

// MARK: -HOUSE
final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    init (name: String, sigil: Sigil, words: Words){
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
}

extension House {
    var count: Int {
        return _members.count
    }
    
    func addPerson(person: Person) {
        guard person.name == self.name else {
            return
        }
        _members.insert(person)
    }
}

// MARK: -SIGIL
final class Sigil {
    let description: String
    let image: UIImage
    
    init (image: UIImage, description: String){
        self.image = image
        self.description = description
    }
}

