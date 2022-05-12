//
//  CircleView.swift
//  trafficLightsApp
//
//  Created by MAC  on 12.05.2022.
//

import SwiftUI

struct CircleView: View {
    let color: Color

    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 80, height: 80)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .blue)
    }
}
