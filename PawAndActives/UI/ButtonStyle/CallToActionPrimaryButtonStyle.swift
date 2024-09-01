//
//  CallToActionPrimaryButtonStyle.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct CallToActionPrimaryButtonStyle: ButtonStyle {
    
    var isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isDisabled ? Color.ABTColor.PastelOrange.opacity(0.5) : Color.ABTColor.PastelOrange)
            .foregroundColor(.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
