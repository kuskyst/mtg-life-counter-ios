//
//  Life.swift
//  mtg-life-counter-ios
//
//  Created by kohsaka on 2024/03/01
//
//

import SwiftUI

struct Life: View {

    var left: Int
    var right: Int

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
    return Life(left: 20, right: 20)
}
