//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Vlad Ryabtsev on 21.01.2022.
//

import SwiftUI

enum Lights {
    case allLightsIsOff
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var nameButton = "GO"
    @State private var currentLight = Lights.allLightsIsOff
    
    private func nextColor() {
        if currentLight == .red {
            currentLight = .yellow
        } else if currentLight == .yellow {
            currentLight = .green
        } else {
            currentLight = .red
        }
    }
    
    var body: some View {
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorCircle(color: .red, opacity: currentLight == .red ? 1 : 0.2)
                ColorCircle(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.2)
                ColorCircle(color: .green, opacity: currentLight == .green ? 1 : 0.2)
                
                Spacer()
                
                ChangeColorButton(title: nameButton) {
                    if nameButton == "GO" {
                        nameButton = "NEXT"
                    }
                    nextColor()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        }
    }
}

