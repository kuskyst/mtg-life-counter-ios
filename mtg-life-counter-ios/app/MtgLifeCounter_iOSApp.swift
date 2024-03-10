//
//  MtgLifeCounter_iOSApp.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI
import RxSwift

@main
struct MtgLifeCounter_iOSApp: App {

    @StateObject private var vm = LifeViewModel()

    private let disposeBag = DisposeBag()

    var body: some Scene {
        WindowGroup {
            ZStack {
                Life(left: self.vm.left, right: self.vm.right)
                Counter(vm: self.vm)
                Buttons()
            }
        }
    }
}
