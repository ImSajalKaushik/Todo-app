//
//  Todo.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 07/01/21.
//

import Foundation
import SwiftUI

class Todo: Identifiable, Codable {
    
    var id = UUID().uuidString
    let todoTitle: String
    var isDone: Bool
    
    init(title: String, isDone: Bool = false) {
        self.todoTitle = title
        self.isDone = isDone
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case todoTitle = "todoTitle"
        case isDone = "done"
    }
}
