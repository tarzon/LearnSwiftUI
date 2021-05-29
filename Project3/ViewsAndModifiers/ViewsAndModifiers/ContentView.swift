//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Nikhil Lihla on 29/05/21.
//

import SwiftUI

// View Modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

// Custome View Modifier
struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
                    content
                    Text(text)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.black)
            }
    }
}

extension View {
    func watermark(text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Hello, world!")
                .modifier(Title())
            
            Text("Extension of a View Modifier")
                .titleStyle()
            
            Text("Custom View Modfier")
                .frame(width: 300, height: 300, alignment: .center)
                .titleStyle()
                .watermark(text: "Nikhil")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
