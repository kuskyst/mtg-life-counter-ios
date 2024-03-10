//
//  Life.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

struct Life: View {

    @AppStorage("right") private var right = 20
    @AppStorage("left") private var left = 20

    var body: some View {
        HStack {
            Text(String(self.left))
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .font(.system(size: 200))
                .foregroundColor(self.left >= 10 ? .blue : .red)
            Text(String(self.right))
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .font(.system(size: 200))
                .foregroundColor(self.right >= 10 ? .blue : .red)
        }
        .background(.black)
    }
}

#Preview {
    return Life()
}
