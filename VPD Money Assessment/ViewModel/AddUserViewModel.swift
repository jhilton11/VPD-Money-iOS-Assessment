//
//  DetailViewModel.swift
//  VPD Money Assessment
//
//  Created by user on 02/10/2022.
//

import Foundation

class AddUserViewModel {
    var user: User?
    var delegate: AddUserViewModelDelegate?
    
    func addUser() {
        guard let user = user else {
            return
        }
        
        saveUser(user)
    }
    
    func saveUser(_ user: User) {
        let realmUser = toRealmUser(user)
        RealmManager.shared.save(user: realmUser) { [weak self]
            error in
            
            guard error == nil else {
                print("There was an error while saving user")
                return
            }
            
            print("Yay!!! There was no error while saving user")
            self?.delegate?.popVC()
        }
        
    }
    
    func isEmailValid() -> Bool {
        guard let user = user else {
            return false
        }
        
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
            
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: user.email)
    }
    
    func isUserNameValid() -> Bool {
        guard let user = user else {
            return false
        }
        
        if (user.username.count) < 5 {
            return false
        } else {
            return true
        }
    }
    
    func isUserValid() -> Bool {
        return user != nil
    }
    
    func toRealmUser(_ user: User) -> RealmUser {
        let realmUser = RealmUser()
        realmUser.id = 1
        realmUser.name = user.name
        realmUser.email = user.email
        realmUser.username = user.username
        realmUser.phone = user.phone
        realmUser.website = user.website
        realmUser.address?.suite = user.address.suite
        realmUser.address?.street = user.address.street
        realmUser.address?.city = user.address.city
        realmUser.address?.zipcode = user.address.zipcode
        realmUser.company?.name = user.company.name
        realmUser.company?.catchPhrase = user.company.catchPhrase
        realmUser.company?.catchPhrase = user.company.bs
        return realmUser
    }
}

protocol AddUserViewModelDelegate: AnyObject {
    func popVC()
}
