//
//  CalculatorButtonView.style.swift
//  SwiftUI-Calculator
//
//  Created by Andrii Boiko (Contractor) on 21.08.2022.
//  Copyright © 2022 Priscilla Ip. All rights reserved.
//

import SwiftUI
import ViewModifierBuilder


struct CalcButtonStyle: Style {
    let spacing: CGFloat = 16
    
    let screenWidth = UIScreen.main.bounds.width
    var button: CalculatorButton
    let font = Font.system(size: 24).weight(.semibold)
    func body(content: Content) -> some View {
        content
            .font(.system(size: button.size).weight(.regular))
            .frame(width: self.buttonWidth(button: button), height: (screenWidth - 5 * self.spacing)  / 4)
            .foregroundColor(button.textColor)
            .background(button.backgroundColor)
            .cornerRadius(self.buttonWidth(button: button))
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (screenWidth - 4 * self.spacing)  / 4 * 2
        }
        return (screenWidth - 5 * self.spacing)  / 4
    }
}
