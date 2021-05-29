//
//  ContentView.swift
//  WeSplit
//
//  Created by Nikhil Lihla on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = 0
    @State private var name: String = ""
    
    let pickerArray = ["pick1", "pick2", "pick3", "pick4"]
    @State private var selectedPicker = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Group {
                        TextField("Enter your name", text: $name).padding()
                    }
                    Group {
                        Text("YourName is \(name)").padding()
                    }
                    Section {
                        ForEach(0..<6) {
                            Text("Row - \($0)").padding()
                        }
                    }
                    Section {
                        Text("Hello, world!").padding()
                        Text("Hello, world!").padding()
                        Text("Hello, world!").padding()
                    }
                }
                Button(action: {
                    self.tapped += 1
                }) { // Content
                    Text("Tapped: \(self.tapped)").padding()
                }.background(Color.gray).foregroundColor(.white).cornerRadius(5.0).border(Color.black, width: 1.2)
                Picker("Select your Picker", selection: $selectedPicker) {
                    ForEach(0..<pickerArray.count) {
                        Text(self.pickerArray[$0])
                    }
                }
            }.navigationBarTitle(Text("SwiftUI"), displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
