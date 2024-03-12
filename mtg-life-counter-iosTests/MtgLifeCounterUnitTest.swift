//
//  MtgLifeCounterUnitTest.swift
//  mtg-life-counter-iosTests
//  
//  Created by kohsaka on 2024/03/01
//
//

import XCTest
import ViewInspector
@testable import mtg_life_counter_ios

final class MtgLifeCounterUnitTest: XCTestCase {

    func testViewModel() throws {
        let target = LifeViewModel()
        target.getLife()
        XCTAssertEqual(target.left, 20)
        XCTAssertEqual(target.right, 20)
    }

    func testLife() throws {
        try XCTContext.runActivity(named: "test life") { _ in
            for i in 0..<2 {
                XCTAssertEqual(try Life(left: 10, right: 10).inspect().hStack().text(i).string(), "10")
            }
        }
    }

    func testCounter() throws {
        try XCTContext.runActivity(named: "test counter") { _ in
            let vm = LifeViewModel()
            let target = try Counter(vm: vm).inspect().hStack()
            var count = 0
            repeat {
                try target.vStack(0).button(1).tap()
                try target.vStack(0).button(0).tap()
                try target.vStack(1).button(1).tap()
                try target.vStack(1).button(0).tap()
                count += 1
            } while (count < 20)
            XCTAssertEqual(vm.left, 20)
            XCTAssertEqual(vm.right, 20)
        }
    }

    func testButtons() throws {
        try XCTContext.runActivity(named: "test buttons") { _ in
            let vm = LifeViewModel()
            let target = try Buttons(vm: vm).inspect().vStack()
            try target.find(button: "reset").tap()
            XCTAssertEqual(vm.left, 20)
            XCTAssertEqual(vm.right, 20)
            try target.find(button: "dice").tap()
            XCTAssertFalse(try target.image(2).isHidden())
        }
    }

}
