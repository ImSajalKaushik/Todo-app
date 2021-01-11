//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 08/01/21.
//

import SwiftUI


struct AddTodoView: View {
    @EnvironmentObject var viewModel: TodoViewModel
    @Binding var addNote: Bool
    @State var data: String = ""
    var todo: Todo?
    var body: some View {
        VStack {
            Text("Enter Todo")
                .padding()
                .font(.title)
                .foregroundColor(.offWhite)
            HStack {
                TextField("", text: $data)
                    .padding()
                    .background(Color.offWhite)
                    .cornerRadius(20)
                Button("Add Note") {
                    postNote(data)
                }
                .disabled(data.isEmpty)
                .padding()
                .foregroundColor(data.isEmpty ? .offWhite : .background)
                .background(data.isEmpty ? Color.blueGray: Color.offWhite)
                //.colorMultiply(todo.isEmpty ? Color.offWhite : Color.blueGray)
                .cornerRadius(20)
            }.padding()
        }
        .background(Color.blueGray)
        .cornerRadius(20)
        
        
        .padding()
    }
    
    
    
    func postNote(_ todoTitle: String) {
        let todo = Todo(title: todoTitle)
        self.viewModel.todos.append(todo)
        self.viewModel.addTodo(todo)
        data = ""
        self.hideKeyboard()
        addNote.toggle()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(addNote: .constant(true), data: "")
    }
}
