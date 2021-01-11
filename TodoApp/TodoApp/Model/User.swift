//
//  User.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 11/01/21.
//

import Foundation


class User: Codable {
    
    let userId: String
    let userName: String
    
    init(userName: String) {
        UserDefaults.standard.set(UUID().uuidString, forKey: "userId")
        UserDefaults.standard.set(userName, forKey: "userName")
        self.userName = UserDefaults.standard.string(forKey: "userName")!
        userId = UserDefaults.standard.string(forKey: "userId")!
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case userName = "name"
    }
}
