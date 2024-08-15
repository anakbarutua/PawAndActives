//
//  PreviewBorderedModifier.swift
//  PawAndActives
//
//  Created by Kelvin Ananda on 15/08/24.
//

import SwiftUI

struct PreviewBorderedModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
                .overlay() {
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(.gray)
                        .strikethrough()
                }
        }
    }
}

extension View {
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View {
        if condition {
          transform(self)
        } else {
          self
        }
    }
    
    func previewBordered() -> some View {
        modifier(PreviewBorderedModifier())
    }
}
