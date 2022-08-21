//
//  ContentView.style.swift
//  SwiftUI-Calculator
//
//  Created by Andrii Boiko (Contractor) on 21.08.2022.
//  Copyright © 2022 Priscilla Ip. All rights reserved.
//

import ViewModifierBuilder
import SwiftUI

struct DialStyle: Style {
    func body(content: Content) -> some View {
        content.foregroundColor(.white)
            .font(.system(size: 100).weight(.light))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
}



struct DialContainer: Style {
    var buttonWidth = (UIScreen.main.bounds.width - 5 * 16) / 4
    func body(content: Content) -> some View {
        content.padding(.trailing).padding(.trailing, buttonWidth / 2 / 4)
    }
}
