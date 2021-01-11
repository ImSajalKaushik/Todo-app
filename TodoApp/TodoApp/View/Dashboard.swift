//
//  Dashboard.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 07/01/21.
//

import Foundation
import SwiftUI

struct Dashboard: View {
    
    @State private var addNote: Bool = false
    @EnvironmentObject var viewModel: TodoViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
//                    Text(UserDefaults.standard.string(forKey: "userName")!)
//                        .padding()
//                        .foregroundColor(.red)
//                        .listRowBackground(Color.clear)
                    ForEach(0..<self.viewModel.todos.count) { index in
                        TodoCell(index: index)
                                .cornerRadius(20)
                    }.id(self.viewModel.todos.count)
                }
                AddTodoView(addNote: $addNote)
                    .shadow(color: .shadowColor, radius: 6, x: 2, y: 2)
                    .offset(y: addNote ? -UIScreen.main.bounds.height/3  - 200 : -UIScreen.main.bounds.height)
                    .animation(.interpolatingSpring(stiffness: 80, damping: 20))
            }
            .background(Color.background)
            .ignoresSafeArea()
            .navigationTitle("Your Todo List")
            .navigationBarItems(trailing: Button(action: {
                                                    addNote.toggle()
                self.hideKeyboard()
            },
                                                 label:
                                                    { Image(systemName: "plus")
                                                        .foregroundColor(.offWhite)
                                                        .padding()
                                                    })
            )
        }
    }
}

let vm = TodoViewModel()
struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard().environmentObject(vm)
    }
}
