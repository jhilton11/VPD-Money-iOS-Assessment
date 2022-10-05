//
//  RealmUser.swift
//  VPD Money Assessment
//
//  Created by user on 04/10/2022.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var username = ""
    @objc dynamic var phone = ""
    @objc dynamic var website = ""
    @objc dynamic var address: RealmAddress? = RealmAddress()
    @objc dynamic var company: RealmCompany? = RealmCompany()
}

class RealmAddress: Object {
    @objc dynamic var street = ""
    @objc dynamic var city = ""
    @objc dynamic var zipcode = ""
    @objc dynamic var suite = ""
}

class RealmCompany: Object {
    @objc dynamic var name = ""
    @objc dynamic var catchPhrase = ""
    @objc dynamic var bs = ""
}
