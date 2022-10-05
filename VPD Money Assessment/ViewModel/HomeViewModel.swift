//
//  HomeViewModel.swift
//  VPD Money Assessment
//
//  Created by user on 30/09/2022.
//

import Foundation

class HomeViewModel {
    var delegate: HomeViewModelDelegate?
    var users = [User]()
    
    func getUsers(urlString: String) {
        ApiManager.getUsers(urlString: urlString) { [weak self]
            data, error in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    self?.delegate?.handleError(error: error!)
                    return
                }
                
                if let users = try? JSONDecoder().decode([User].self, from: data!) {
                    self?.users = users
                    self?.getRealmUsers()
                } else {
                    print("Error while decoding")
                }
            }
        }
    }
    
    func getRealmUsers() {
        RealmManager.shared.getUsers { [weak self]
            realmUsers in
            print("Realm users: \(realmUsers.count)")
            self?.users.append(contentsOf: realmUsers)
            self?.delegate?.handleData()
        }
    }
    
}

protocol HomeViewModelDelegate: AnyObject {
    func handleError(error: Error)
    
    func handleData()
}
