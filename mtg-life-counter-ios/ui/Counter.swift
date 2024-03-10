//
//  Counter.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

struct Counter: View {

    @AppStorage("right") private var right = 20
    @AppStorage("left") private var left = 20

    var body: some View {
        HStack {
            VStack {
                Button( action: {
                    self.left += 1
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                        .ignoresSafeArea()
                }
                Button(action: {
                    if (self.left > 0) { self.left -= 1 }
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                        .ignoresSafeArea()
                }
            }
            VStack {
                Button(action: {
                    self.right += 1
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                        .ignoresSafeArea()
                }
                Button(action: {
                    if (self.right > 0) { self.right -= 1 }
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
    return Counter().background(.black)
}
