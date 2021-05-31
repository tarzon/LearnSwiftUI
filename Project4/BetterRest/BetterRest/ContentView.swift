//
//  ContentView.swift
//  BetterRest
//
//  Created by Nikhil Lihla on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.00
    @State private var wakeUp = Date()
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        ZStack {
            Color(.blue)
            VStack(spacing: 50) {
                // Loading Static and Dynamic data altogether in a List
                List {
                    Section(header: Text("Section 1")) {
                        Text("Hello 1")
                        Text("Hello 2")
                    }
                    Section(header: Text("Section 2")) {
                        ForEach(0..<5) { row in
                            Text("Dynamic Row: \(row)")
                        }
                    }
                    Section(header: Text("Section 3")) {
                        Text("Awesome 1")
                        Text("Awesome 2")
                    }
                }
                .listStyle(GroupedListStyle())
                ZStack{
                    Color(.orange) // using for filling up backgrounds
                    VStack(alignment: .center, spacing: 20) {
                        Text("Acting as a aeparator")
                        Stepper("Sleep Required: \(sleepAmount, specifier: "%.2f") hours", value: $sleepAmount, in: 4 ... 12, step: 0.25 ).padding()

                        DatePicker("Select Date", selection: $wakeUp, in: Date()..., displayedComponents: .date).padding()
                    }
                }
                
                // Dynmaically loading data without foreach
                List(0 ..< 10) {
                    Text("Dyanamic List \($0)")
                }
                
                // Dynamically loading data from the Array using `id`
                List(people, id: \.self) {
                            Text($0)
                        }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
