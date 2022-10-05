//
//  User.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import Foundation

struct User: Codable {
    let id: Int
    var name: String = ""
    var email: String = ""
    var username: String = ""
    var phone: String = ""
    var website: String = ""
    var address: Address = Address()
    var company: Company = Company()
}

struct Address: Codable {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
    //let geo: Geo
}

struct Company: Codable {
    var name: String = ""
    var catchPhrase: String = ""
    var bs: String = ""
}

struct Geo: Codable {
    let lat: Double
    let lng: Double
}
