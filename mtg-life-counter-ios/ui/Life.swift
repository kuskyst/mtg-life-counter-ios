//
//  Life.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

struct Life: View {

    @Binding var life: LifeEntity

    var body: some View {
        HStack {
            Text(String(self.life.left))
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .font(.system(size: 200))
                .foregroundColor(self.life.left >= 10 ? .blue : .red)
            Text(String(self.life.right))
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .font(.system(size: 200))
                .foregroundColor(self.life.right >= 10 ? .blue : .red)
        }
        .background(.black)
    }
}

#Preview {
    @State var previewLife = LifeEntity(date: "1", left: 20, right: 20)
    return Life(life: $previewLife)
}
