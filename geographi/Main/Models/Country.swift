//
//  Country.swift
//  geographi
//
//  Created by Tommy Bartocci on 7/11/23.
//

import Foundation


struct Country: Codable {
    var name: String
    var alpha3Code: String?
    var capital: String?
    var region: String?
    var population: Int?
    var flags: Flag?
    var currencies: [Currency]?
    var languages: [Language]?
}

struct Flag: Codable {
    var svg: String?
    var png: String?
}

struct Language: Codable {
    var name: String?
}

struct Currency: Codable {
    var name: String?
}
