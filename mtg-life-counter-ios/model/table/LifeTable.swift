//
//  LifeTable.swift
//  mtg-life-counter-ios
//  
//  Created by kohsaka on 2024/03/10
//  
//

import Foundation
import GRDB

struct LifeTable: Codable, FetchableRecord, MutablePersistableRecord {

    var date = "2099-12-31"
    var left = 20
    var right = 20

    static var databaseTableName: String {
        return "life"
    }

}
