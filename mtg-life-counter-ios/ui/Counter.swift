//
//  Counter.swift
//  mtg-life-counter-ios
//
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

struct Counter: View {

    var vm: LifeViewModel

    var body: some View {
        HStack {
            VStack {
                Button( action: {
                    self.vm.saveLife(
                        left: self.vm.left + 1, right: self.vm.right)
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                        .ignoresSafeArea()
                }.accessibility(identifier: "left up")
                Button(action: {
                    if (self.vm.left > 0) {
                        self.vm.saveLife(
                            left: self.vm.left - 1,
                            right: self.vm.right)
                    }
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                        .ignoresSafeArea()
                }.accessibility(identifier: "left down")
            }
            VStack {
                Button(action: {
                    self.vm.saveLife(
                        left: self.vm.left, right: self.vm.right + 1)
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                        .ignoresSafeArea()
                }.accessibility(identifier: "right up")
                Button(action: {
                    if (self.vm.right > 0) {
                        self.vm.saveLife(
                            left: self.vm.left,
                            right: self.vm.right - 1)
                    }
                }) {
                    Rectangle()
                        .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.1))
                        .ignoresSafeArea()
                }.accessibility(identifier: "right down")
            }
        }
    }
}

#Preview {
    return Counter(vm: LifeViewModel()).background(.black)
}
