//
//  MtgLifeCounter_iOSApp.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

@main
struct MtgLifeCounter_iOSApp: App {

    var body: some Scene {
        WindowGroup {
            ZStack {
                Life()
                Counter()
                Buttons()
            }
        }
    }
}
