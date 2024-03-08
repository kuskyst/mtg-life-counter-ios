//
//  Buttons.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/08
//  
//

import SwiftUI

struct Buttons: View {

    @Binding var life: LifeEntity
    @State private var roll = 1
    @State private var visible = false

    var body: some View {
        VStack {
            Button(action: {
                self.life = LifeEntity(date: "1", left: 20, right: 20)
            }) {
                Text("reset")
                    .padding(8.0)
                    .frame(width: 80.0)
                    .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4))
                    .foregroundColor(.white)
            }
            .cornerRadius(8.0)
            .padding(12.0)
            Spacer()
            Image("dice\(roll)")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color.white)
                .scaledToFit()
                .frame(width: 160.0, height: 160.0)
                .scaleEffect(visible ? 0.8 : 0)
                .rotationEffect(Angle(degrees: visible ? 360 : 0))
                .offset(x: visible ? 0 : -50, y: visible ? 0 : -50)
                .animation(.easeInOut(duration: 0.7), value: visible)
            Spacer()
            Button(action: {
                withAnimation { self.visible = !self.visible }
                if self.visible { self.roll = Int.random(in: 1..<7) }
            }) {
                Text("dice")
                    .padding(8.0)
                    .frame(width: 80.0)
                    .background(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.4))
                    .foregroundColor(.white)
            }
            .cornerRadius(8.0)
        }
    }
}

#Preview {
    @State var previewLife = LifeEntity(date: "1", left: 20, right: 20)
    @State var previewDice = 1
    return Buttons(life: $previewLife)
}
