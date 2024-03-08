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
            Button(action: {
            
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
    return Buttons(life: $previewLife)
}
