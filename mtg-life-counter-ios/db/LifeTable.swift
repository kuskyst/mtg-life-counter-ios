//
//  LifeTable.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/10
//  
//

import Foundation
import GRDB

struct LifeTable : Codable, FetchableRecord, MutablePersistableRecord {

    var date = "2099-12-31"
    var left = 20
    var right = 20

    static var databaseTableName: String {
        return "life"
    }

    static func create(_ queue: DatabaseQueue) {
        try! queue.write { db in
            try! db.create(table: self.databaseTableName) { t in
                t.column("date", .text).primaryKey(onConflict: .replace, autoincrement: false)
                t.column("left", .integer).notNull()
                t.column("right", .integer).notNull()
            }
        }
    }

}
