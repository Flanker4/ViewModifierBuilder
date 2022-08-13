//
//  File.swift
//  
//
//  Created by Andrii Boiko (Contractor) on 14.08.2022.
//

import Foundation
import SwiftUI


struct Rounded: Style {
    func body(content: Content) -> some View {
        content.cornerRadius(20.0)
    }
}

@available(iOS 15.0, *)
struct Green: Style {
    func body(content: Content) -> some View {
        content.padding(30).background(.green)
    }
}

struct HelloWorld: Style {
    func body(content: Content) -> some View {
        content.foregroundColor(.red)
    }
}

@available(iOS 15.0, *)
struct ContentView: View {
    var isEnabled = true
    var body: some View {
        VStack {
            Text("Hello, world!").modifiers {
                Green()
                if (isEnabled){
                    Rounded()
                } else {
                    Rounded()
                }
                HelloWorld()
            }
            Text("Hello, world!").modifiers { HelloWorld() }
            Button("Delete") {

            }.modifiers {
                Green()
                Rounded()
            }
            
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
