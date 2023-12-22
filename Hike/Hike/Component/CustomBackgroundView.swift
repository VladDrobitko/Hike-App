//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by Владислав Дробитько on 29.10.2023.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            //MARK: - Depth
            
            Color.customGreenDark
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(x:5, y:12)
            
            //MARK: - Light
            
            Color.customGreenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(x:1, y:3)
                .opacity(0.85)
            
            
            //MARK: - Surface
            
            LinearGradient(
                colors: [.customGreenLight,
                         .customGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
