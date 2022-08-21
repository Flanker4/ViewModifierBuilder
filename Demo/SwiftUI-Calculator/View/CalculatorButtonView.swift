//
//  CalculatorButtonView.swift
//  SwiftUI-Calculator
//
//  Created by Andrii Boiko (Contractor) on 21.08.2022.
//  Copyright © 2022 Priscilla Ip. All rights reserved.
//

import SwiftUI


//MARK: - SubViews

struct CalculatorButtonView: View {
    
    var button: CalculatorButton
  
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        Button(action: {
            self.env.receiveInput(calculatorButton: self.button)
        }) {
            Text(button.title).styles { CalcButtonStyle(button: button) }
        }
    }
}
