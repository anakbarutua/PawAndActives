//
//  ButtonView.swift
//  PawAndActives
//
//  Created by Nadya Margareth Angkawijaya on 15/08/24.
//

import SwiftUI

struct ButtonView: View {
    let label: String
    let icon: String?
    let action: () -> Void
    
    init(
        label: String,
        icon: String? = nil,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.icon = icon
        self.action = action
    }
    var body: some View {
        GeometryReader { geo in
            Button {
                action()
            } label: {
                if let icon {
                    Image(systemName: icon)
                        .foregroundColor(.black)
                }
                Text(label)
                    .font(.system(size: 20))
                    .foregroundColor(Color.ABTColor.CharlestonGreen)
                    .fontWeight(.bold)
                    .frame(width: geo.size.width * 0.89, height: geo.size.height * 0.4)
                        .background(RoundedRectangle(cornerRadius: 10.0).fill(Color.ABTColor.MikadoYellow))
                        .padding(.top, geo.size.height * 0.006)
            }
        }
    }

    
}
