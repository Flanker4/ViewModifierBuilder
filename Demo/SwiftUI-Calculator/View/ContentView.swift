//
//  ContentView.swift
//  SwiftUI-Calculator
//
//  Created by Priscilla Ip on 2020-07-15.
//  Copyright © 2020 Priscilla Ip. All rights reserved.
//

import SwiftUI


//MARK: - ContentView

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment

    let spacing: CGFloat = 16
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals]
    ]

    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: self.spacing) {
                
                HStack {
                    Spacer()
                    Text(env.display).styles { DialStyle() }
                }.styles { DialContainer() }
                
                ForEach(buttons, id: \.self) { row in
                    HStack (spacing: self.spacing) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
}

//MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
