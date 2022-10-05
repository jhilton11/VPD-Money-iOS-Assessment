//
//  RealmManager.swift
//  VPD Money Assessment
//
//  Created by user on 04/10/2022.
//

import Foundation
import RealmSwift

class RealmManager {
    static var shared = RealmManager()
    
    let realm = try! Realm()
    
    private init() {
        
    }
    
    func save(user: RealmUser, completed: @escaping (Error?) -> Void) {
        do {
            try realm.write {
                realm.add(user)
                completed(nil)
            }
        } catch {
            print(error.localizedDescription)
            completed(error)
        }
    }
    
    func getUsers(completed: @escaping ([User]) -> Void) {
        let result = realm.objects(RealmUser.self)
        var realmUsers = [User]()
        
        realmUsers = toUsers(result)
        completed(realmUsers)
    }
    
    func toUsers(_ realmUsers: Results<RealmUser>) -> [User] {
        var users = [User]()
        for realmUser in realmUsers {
            var temp = User(id: realmUser.id)
            temp.name = realmUser.name
            temp.email = realmUser.email
            temp.username = realmUser.username
            temp.phone = realmUser.phone
            temp.website = realmUser.website
            temp.address.street = realmUser.address!.street
            temp.address.suite = realmUser.address!.suite
            temp.address.city = realmUser.address!.city
            temp.address.zipcode = realmUser.address!.zipcode
            temp.company.name = realmUser.company!.name
            temp.company.catchPhrase = realmUser.company!.catchPhrase
            temp.company.bs = realmUser.company!.bs
            users.append(temp)
        }
        return users
    }
    
}
