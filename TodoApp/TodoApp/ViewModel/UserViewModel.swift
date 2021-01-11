//
//  UserViewModel.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 11/01/21.
//

import Foundation


class UserViewModel {
    
    func getUserName() -> String? {
        guard let name = UserDefaults.standard.string(forKey: "userName") else {
           return nil
        }
        return name
    }
    
    func getUserId() -> String? {
        guard let id = UserDefaults.standard.string(forKey: "userId") else {
           return nil
        }
        return id
    }
    
    func createUser(with name: String) {
        let user  = User(userName: name)
        NetworkService().createUser(user: user) { (success) in
            if let result = success {
                if result {
                    print("USER CREATED....SUCCESSFULLY")
                } else {
                    print("ISSUE IN USER CREATION")
                }
            }
        }
    }
}
