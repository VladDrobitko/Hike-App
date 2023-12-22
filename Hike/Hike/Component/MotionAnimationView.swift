//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Владислав Дробитько on 30.10.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    //MARK: - FUnctions
    
    //1. Random coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    //2. Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    //3. Random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //4. Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    //5. Random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(Color.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(),
                              y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        }//:-ZStack
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
   MotionAnimationView()
        .background(
            Circle()
                .fill(.teal )
        )
}
