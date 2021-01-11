//
//  TodoService.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 08/01/21.
//

import Foundation


class NetworkService {
    
    let userId: String?
    
    init() {
        self.userId = UserDefaults.standard.string(forKey: "userId")
    }
    
    
    func createToDo(todo: Todo, completion: @escaping (Bool?) -> ()) {
        
        guard let userId = userId else {return}
        guard let url = URL(string: "http://localhost:8080/user/{id}/getTodos".replacingOccurrences(of: "{id}", with: userId)) else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(todo)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            let success = try? JSONDecoder().decode(Bool.self, from: data)
            DispatchQueue.main.async {
                 completion(success)
            }
        }.resume()
    }
    
    
    
    
    func getAllTodos(completion: @escaping ([Todo]?) -> ()) {
        guard let userId = userId else {return}
        guard let url = URL(string: "http://localhost:8080/user/{id}/getTodos".replacingOccurrences(of: "{id}", with: userId)) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let order = try? JSONDecoder().decode([Todo].self, from: data)
            DispatchQueue.main.async {
                completion(order)
            }
        }.resume()
    }
    
    
    
    func createUser(user: User, completion: @escaping (Bool?) -> ()) {
        guard let url = URL(string: "http://localhost:8080/user") else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody =  try? JSONEncoder().encode(user)
       
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let success = try? JSONDecoder().decode(Bool.self, from: data)
            DispatchQueue.main.async {
                 completion(success)
            }
        }.resume()
    }
    
    
    func updateTodo(_ todo: Todo, completion: @escaping (Bool?) -> ()) {
        guard let userId = userId else {return}
        guard let url = URL(string: "http://localhost:8080/user/{id}/setTodos".replacingOccurrences(of: "{id}", with: userId)) else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(todo)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let success = try? JSONDecoder().decode(Bool.self, from: data)
            DispatchQueue.main.async {
                 completion(success)
            }
        }.resume()
    }
}
