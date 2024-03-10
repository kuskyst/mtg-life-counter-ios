//
//  LifeViewModel.swift
//  mtg-life-counter-ios
//
//  Created by kohsaka on 2024/03/10
//
//

import Foundation
import Combine
import GRDB
import RxGRDB
import RxSwift

class LifeViewModel: ObservableObject {

    @Published var left = 20
    @Published var right = 20

    private var queue: DatabaseQueue
    private let disposeBag = DisposeBag()
    private var now = "2099-12-31"

    init() {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        self.now = df.string(from: Date())
        self.queue = LifeDataBase.createQueue()
        self.getLife()
    }

    func getLife() {
        self.queue.rx.read { db in
            try! LifeTable.filter(Column("date") == self.now).fetchOne(db) ?? LifeTable()
        }.subscribe(
            onSuccess: { v in
                self.left = v.left
                self.right = v.right
            },
            onFailure: { error in
                print("error: \(error)")
            }
        ).disposed(by: self.disposeBag)
    }

    func saveLife(left: Int, right: Int) {
        var target = LifeTable(date: self.now, left: left, right: right)
        self.queue.rx.write { db in
            try! target.insert(db)
        }.subscribe(
            onSuccess: { v in
                self.getLife()
            },
            onFailure: { error in
                print("error: \(error)")
            }
        ).disposed(by: self.disposeBag)
    }

}
