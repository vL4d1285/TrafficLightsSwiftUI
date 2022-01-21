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
    
    @State private var currentLight = Lights.allLightsIsOff
    @State private var nameButton = "GO"
    
    fileprivate func nextColor() {
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
            VStack{
                if currentLight == .red {
                    redLight.opacity(1)
                    yellowLight.opacity(0.2)
                    greenLight.opacity(0.2)
                } else if currentLight == .yellow {
                    redLight.opacity(0.2)
                    yellowLight.opacity(1)
                    greenLight.opacity(0.2)
                } else if currentLight == .green {
                    redLight.opacity(0.2)
                    yellowLight.opacity(0.2)
                    greenLight.opacity(1)
                } else {
                    redLight.opacity(0.2)
                    yellowLight.opacity(0.2)
                    greenLight.opacity(0.2)
                }
                
                Spacer(minLength: 300)
                
                Button(action: {
                    nameButton = "NEXT"
                    nextColor()
                }) {
                    Text("\(nameButton)")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .frame(width: 250)
                        .background(Color.blue)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 4)
                        )
                }
                
            }
        }.background(Color.black)
    }
}

var redLight: some View {
    Circle()
        .foregroundColor(.red)
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
}

var yellowLight: some View {
    Circle()
        .foregroundColor(.yellow)
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
}

var greenLight: some View {
    Circle()
        .foregroundColor(.green)
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        }
    }
}
