//
//  LifeDataBase.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/10
//  
//

import Foundation
import GRDB

class LifeDataBase {

    static func createQueue() -> DatabaseQueue {
        let manager = FileManager.default
        let directoryURL = manager.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let dbURL = directoryURL.appendingPathComponent("life.sqlite")
        var isDirectory: ObjCBool = false
        if !manager.fileExists(atPath: directoryURL.path, isDirectory: &isDirectory) {
            try! manager.createDirectory(atPath: directoryURL.path, withIntermediateDirectories: false)
        }
        try! manager.setAttributes([.protectionKey: FileProtectionType.complete], ofItemAtPath: directoryURL.path)
        let queue = try! DatabaseQueue(path: dbURL.path)
        self.createTable(queue)
        return queue
    }

    static func createTable(_ queue: DatabaseQueue) {
        try! queue.write { db in
            if !(try! db.tableExists(LifeTable.databaseTableName)) {
                try! db.create(table: LifeTable.databaseTableName) { t in
                    t.column("date", .text).unique(onConflict: .replace)
                    t.column("left", .integer).notNull()
                    t.column("right", .integer).notNull()
                }
            }
        }
    }

}
