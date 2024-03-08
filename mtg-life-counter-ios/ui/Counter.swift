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
                    life.left += 1
                }) {
                    Text("")
                        .frame(maxWidth:.infinity,
                                maxHeight: .infinity)
                }
                .frame(maxWidth:.infinity,
                        maxHeight: .infinity)
                Button(action: {
                    life.left -= 1
                }) {
                    Text("")
                        .frame(maxWidth:.infinity,
                                maxHeight: .infinity)
                }
                .frame(maxWidth:.infinity,
                        maxHeight: .infinity)
            }
            .frame(maxWidth:.infinity,
                   maxHeight: .infinity)
            VStack {
                Button(action: {
                    life.right += 1
                }) {
                    Text("")
                        .frame(maxWidth:.infinity,
                                maxHeight: .infinity)
                }
                .frame(maxWidth:.infinity,
                    maxHeight: .infinity)
                Button(action: {
                    life.right -= 1
                }) {
                    Text("")
                        .frame(maxWidth:.infinity,
                              maxHeight: .infinity)
                }
                .frame(maxWidth:.infinity,
                    maxHeight: .infinity)
            }
            .frame(maxWidth:.infinity,
                   maxHeight: .infinity)
        }
    }
}

#Preview {
    @State var previewLife = LifeEntity(date: "1", left: 20, right: 20)
    return Counter(life: $previewLife)
}
