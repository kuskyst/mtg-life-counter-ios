//
//  Counter.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

struct Counter: View {

    @Binding var life: LifeEntity

    var body: some View {
        HStack {
            VStack {
                Button( action: {
                    self.life.left += 1
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                        .ignoresSafeArea()
                }
                Button(action: {
                    if (self.life.left > 0) { self.life.left -= 1 }
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                        .ignoresSafeArea()
                }
            }
            VStack {
                Button(action: {
                    self.life.right += 1
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                        .ignoresSafeArea()
                }
                Button(action: {
                    if (self.life.right > 0) { self.life.right -= 1 }
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    @State var previewLife = LifeEntity(date: "1", left: 20, right: 20)
    return Counter(life: $previewLife).background(.black)
}
