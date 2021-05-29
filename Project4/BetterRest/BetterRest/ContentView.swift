//
//  ContentView.swift
//  BetterRest
//
//  Created by Nikhil Lihla on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.00
    
    var body: some View {
        Stepper("Sleep Required: \(sleepAmount, specifier: "%.2f") hours", value: $sleepAmount, in: 4 ... 12, step: 0.25 ).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
