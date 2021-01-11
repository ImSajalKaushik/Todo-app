//
//  Extensions.swift
//  TodoApp
//
//  Created by Sajal Kaushik on 07/01/21.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color( red: 42/255, green:  61/255, blue:  69/255)
    static let active = Color( red: 221/255, green:  115/255, blue: 115/255)
    static let inActive  = Color( red: 234/255, green:  235/255, blue: 237/255)
    static let highlight  = Color( red: 220/255, green:  226/255, blue: 170/255)
    static let blueGray  = Color( red: 108/255, green:  150/255, blue: 157/255)
    static let offWhite = Color( red: 225/255, green:  225/255, blue:  235/255)
    static let shadowColor = Color.black.opacity(16.0)
}



#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
