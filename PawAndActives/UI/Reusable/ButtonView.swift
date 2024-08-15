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
        Button {
            action()
        } label: {
            if let icon {
                Image(systemName: icon)
                    .foregroundColor(.black)
            }
            Text(label)
                .font(.system(size: 20))
                .foregroundColor(Color.black)
        }
    }

    
}
