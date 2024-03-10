//
//  MtgLifeCounterApp.swift
//  mtg-life-counter-ios
//
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI
import RxSwift

@main
struct MtgLifeCounterApp: App {

    @StateObject private var vm = LifeViewModel()

    var body: some Scene {
        WindowGroup {
            ZStack {
                Life(left: self.vm.left, right: self.vm.right)
                Counter(vm: self.vm)
                Buttons(vm: self.vm)
            }
        }
    }
}
