//
//  Utente.swift
//  iOS_18_Lab07
//
//  Created by Gianni Savini on 08/06/18.
//  Copyright © 2018 Gianni Savini. All rights reserved.
//

import Foundation


class Utente {
    
    var name : String
    var surname : String
    var age : Int
    var nummber : String
    
    init(name : String, age :Int, surname : String, number : String ) {
        self.name = name
        self.surname = surname
        self.age = age
        self.nummber = number
    }
}
