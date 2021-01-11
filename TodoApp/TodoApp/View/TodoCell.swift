//
//  TodoCell.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 08/01/21.
//

import SwiftUI

struct TodoCell: View {
    @EnvironmentObject var viewModel: TodoViewModel
    var index: Int
    var body: some View {
        HStack() {
            Text(viewModel.todos[index].todoTitle)
                .lineLimit(nil)
                .foregroundColor(viewModel.todos[index].isDone ? Color.secondary :  .offWhite)
                .padding()
            Spacer()
            Image(systemName: viewModel.todos[index].isDone ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .foregroundColor(viewModel.todos[index].isDone ? Color.secondary: .offWhite)
                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .onTapGesture(perform: {
                    updateTodo()
                })
        }
        .background(viewModel.todos[index].isDone ? Color.inActive : Color.active)
        .listRowBackground(Color.clear)
    }
    
    func updateTodo() {
        viewModel.updateTodo(index: index)
    }
}

struct TodoCell_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
