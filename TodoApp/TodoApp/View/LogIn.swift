//
//  SwiftUIView.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 11/01/21.
//

import SwiftUI

struct LogIn: View {
    let viewModel = UserViewModel()
    @State private var userName = ""
    @State var loggedIn = false
    var body: some View {
        ZStack {
            Color.background
            VStack {
                Text(userName)
                    .font(.title)
                    .foregroundColor(.highlight)
                    .padding()
                
                TextField("Enter your username", text: $userName)
                    .padding()
                    .background(Color.highlight)
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                    .padding()
                Button("Enter the app", action: createUser)
                    .disabled(userName.isEmpty)
                    .padding()
                    .foregroundColor(userName.isEmpty ? .offWhite : .white)
                    .background(userName.isEmpty ? Color.blueGray: Color.active)
                    .cornerRadius(20)
                
            }.fullScreenCover(isPresented: $loggedIn,
                              content: {
                Dashboard().environmentObject(TodoViewModel())
            })
        }.ignoresSafeArea()
    }
    
    func setDestination() {
    }
    
    func createUser() {
        loggedIn = true
        viewModel.createUser(with: userName)
        self.hideKeyboard()
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
