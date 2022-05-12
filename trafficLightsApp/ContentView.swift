//
//  ContentView.swift
//  trafficLightsApp
//
//  Created by MAC  on 12.05.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var redLight = CircleView(color: .red)
    @State private var yellowLight = CircleView(color: .yellow)
    @State private var greenLight = CircleView(color: .green)
    
    @State private var currentLight = CurrentLight.red
    @State private var redOpacity: CGFloat = 0.3
    @State private var yellowOpacity: CGFloat = 0.3
    @State private var greenOpacity: CGFloat = 0.3
    
    @State private var buttonTitle = "START"
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                redLight.opacity(redOpacity)
                yellowLight.opacity(yellowOpacity)
                greenLight.opacity(greenOpacity)
                Spacer()
                button
            }
            .padding()
        }
    }
    
    private var button: some View {
        Button(action: nextColor, label: {
            Text(buttonTitle)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 100)
        })
        .tint(.blue)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 15))
    }
    
    private func nextColor() {
         if buttonTitle == "START" {
            buttonTitle = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenOpacity = 0.3
            redOpacity = 1
            currentLight = .yellow
        case .yellow:
            redOpacity = 0.3
            yellowOpacity = 1
            currentLight = .green
        case .green:
            yellowOpacity = 0.3
            greenOpacity = 1
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
