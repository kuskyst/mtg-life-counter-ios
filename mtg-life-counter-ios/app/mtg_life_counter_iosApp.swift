//
//  mtg_life_counter_iosApp.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

@main
struct mtg_life_counter_iosApp: App {

    @State private var life = LifeEntity(date: "1", left: 20, right: 20)

    var body: some Scene {
        WindowGroup {
            ZStack {
                Life(life: $life)
                Counter(life: $life)
            }
        }
    }
}
