//
//  BarProgressStyle.swift
//  PawAndActives
//
//  Created by Nadya Margareth Angkawijaya on 14/08/24.
//

import Foundation
import SwiftUI

struct BarProgressStyle: ProgressViewStyle {

    var color: Color = Color.ABTColor.PrussianBlue
    var height: Double = 20.0
    var labelFontStyle: Font = .body

    func makeBody(configuration: Configuration) -> some View {

        let progress = configuration.fractionCompleted ?? 0.0

        GeometryReader { geometry in

            VStack(alignment: .leading) {

                configuration.label
                    .font(labelFontStyle)
                    .foregroundColor(Color.ABTColor.Black)

                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.ABTColor.PastelOrange)
                    .frame(height: height)
                    .frame(width: geometry.size.width)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(color)
                            .frame(width: geometry.size.width * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {

                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(Color.ABTColor.Black)
                                }
                            }
                    }

            }

        }
    }
}

