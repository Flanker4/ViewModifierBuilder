//
//  GlobalEnvironment.swift
//  SwiftUI-Calculator
//
//  Created by Andrii Boiko (Contractor) on 21.08.2022.
//  Copyright © 2022 Priscilla Ip. All rights reserved.
//

import SwiftUI


extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case equals, add, subtract, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .add: return "+"
        case .subtract: return "-"
        case .multiply: return "×"
        case .divide: return "÷"
        case .plusMinus: return "±"
        case .percent: return "%"
        case .decimal: return "."
        case .equals: return "="
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
    var textColor: Color {
        switch self {
        case .ac, .plusMinus, .percent:
            return Color(.black)
        default:
            return .white
        }
    }
    
    var size: CGFloat {
        switch self {
        case .ac, .plusMinus, .percent:
            return 28.0
        default:
            return 32.0
        }
    }
}

//MARK: - Global Application State

class GlobalEnvironment: ObservableObject {
    
    @Published var display = "0"
    
    //MARK: - Variables and Properties
    
    private var isFinishedTypingNumber: Bool = true
    private var lastInput: CalculatorButton?
    
    private var displayValue: Double {
        get {
            guard let number = Double(self.display) else { fatalError("Cannot convert display label text to a Double") }
            return number
        }
        set {
            self.display = newValue.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", newValue) : String(newValue)
        }
    }

    private var calculator = CalculatorLogic()
    
    //MARK: - Internal Methods
    
    private func isLastInputOperator() -> Bool {
        guard let lastInput = lastInput else { return false }
            return lastInput == .divide || lastInput == .multiply || lastInput == .add || lastInput == .subtract
    }
    
    func receiveInput(calculatorButton: CalculatorButton) {

        switch calculatorButton {
        case .ac, .plusMinus, .percent, .divide, .multiply, .subtract, .add, .equals:
            
            // check for two consecutive operators
            if isLastInputOperator() { break }
            
            isFinishedTypingNumber = true
            
            calculator.setNumber(displayValue)

            if let result = calculator.calculate(symbol: calculatorButton) {
                displayValue = result
            }
            
        default:
            
            if isFinishedTypingNumber {
                
                // do not duplicate zeros
                if displayValue == 0 && calculatorButton == .zero { return }
                
                if calculatorButton == .decimal {
                    self.display = "0" + calculatorButton.title
                } else { self.display = calculatorButton.title }
                
                isFinishedTypingNumber = false
                
            } else {
                
                if calculatorButton == .decimal {
                    
                    // check if number is whole number
                    if self.display.contains(".") { return }

                    // check if number already has a decimal
                    let isInt = floor(displayValue) == displayValue
                    if !isInt { return }
                }
                self.display = self.display + calculatorButton.title
            }
        }
        lastInput = calculatorButton
    }
}
