//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Владислав Дробитько on 30.10.2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //Conditional Statement with Nil Coalescing
                //Condition ? A : B
                configuration.isPressed ?
                //A : When user pressed the button
                    LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                //B : When the button is not pressed
                :
                
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
