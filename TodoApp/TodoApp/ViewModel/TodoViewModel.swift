//
//  TodoViewModel.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 07/01/21.
//

import Foundation
import SwiftUI
import Combine

class TodoViewModel: ObservableObject {
    let service: NetworkService
    
    @Published var todos = [Todo]()
    
    @Published var updated = false
    init() {
        service = NetworkService()
        fetchAllTodo()
    }
    
    
    func addTodo(_ todo: Todo) {
        service.createToDo(todo: todo) { (result) in
            if let result = result {
                if result {
                    print("SUCCESS IN POSTING")
                } else {
                    print("Error IN POSTING")
                }
            }
        }
    }
    
    
    func fetchAllTodo() {
        service.getAllTodos { (result) in
            if let result = result {
                self.todos = result
            }
        }
    }
    
    
    func updateTodo(index: Int) {
        self.todos[index].isDone.toggle()
        self.updated = true
        service.updateTodo(todos[index]) { (result) in
            if let result = result {
                if result {
                    print("SUCCESS IN UPDATING")
                } else {
                    print("ERROR IN UPDATING")
                }
               
            }
        }
    }
}
