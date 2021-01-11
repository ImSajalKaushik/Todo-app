//
//  ContentView.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 11/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            if (UserDefaults.standard.string(forKey: "userId") != nil) {
                Dashboard().environmentObject(TodoViewModel())
            } else {
                LogIn()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
