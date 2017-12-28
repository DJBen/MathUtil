//
//  AngleTests.swift
//  MathUtilTests
//
//  Created by Sihao Lu on 12/27/17.
//  Copyright © 2017 Sihao. All rights reserved.
//

import XCTest
@testable import MathUtil

class AngleTests: XCTestCase {

    let accuracy = 1e-8

    func testRadianFromDegree() {
        let radianAngle = RadianAngle(Double.pi / 3)
        let degreeAngle = DegreeAngle(60)
        let converted = DegreeAngle.init(radianAngle: radianAngle)
        XCTAssertEqual(converted.value, degreeAngle.value, accuracy: accuracy)
    }

    func testDegreeFromRadians() {
        let radianAngle = RadianAngle(Double.pi / 2.5)
        let degreeAngle = DegreeAngle(72)
        let converted = RadianAngle.init(degreeAngle: degreeAngle)
        XCTAssertEqual(converted.value, radianAngle.value, accuracy: accuracy)
    }

    func testHourFromRadian() {
        let radianAngle = RadianAngle(Double.pi * 3 / 2)
        let hourAngle = HourAngle(18)
        let converted = HourAngle(radianAngle: radianAngle)
        XCTAssertEqual(converted.value, hourAngle.value, accuracy: accuracy)
    }

    func testRadianFromHour() {
        let radianAngle = RadianAngle(Double.pi * 1 / 2)
        let hourAngle = HourAngle(6)
        let converted = RadianAngle(hourAngle: hourAngle)
        XCTAssertEqual(converted.value, radianAngle.value, accuracy: accuracy)
    }

    func testHourAngleCompoundDisplay() {
        let hourAngle = HourAngle(degreeAngle: DegreeAngle(101.2875))
        hourAngle.compoundDecimalNumberFormatter = NumberFormatter()
        XCTAssertEqual(hourAngle.sign, 1)
        XCTAssertEqual(hourAngle.components[0], 6)
        XCTAssertEqual(hourAngle.components[1], 45)
        XCTAssertEqual(hourAngle.components[2], 9, accuracy: 0.5)
        XCTAssertEqual(hourAngle.value, 6.7525, accuracy: accuracy)
        XCTAssertEqual(hourAngle.compoundDescription, "6h 45m 9s")
    }

    func testDegreeAngleCompoundDisplay() {
        let degreeAngle = DegreeAngle(-26.432002)
        degreeAngle.wrapMode = .range_180
        degreeAngle.compoundDecimalNumberFormatter = NumberFormatter()
        XCTAssertEqual(degreeAngle.sign, -1)
        XCTAssertEqual(degreeAngle.components[0], 26)
        XCTAssertEqual(degreeAngle.components[1], 25)
        XCTAssertEqual(degreeAngle.components[2], 55.2094, accuracy: 1e-2)
        XCTAssertEqual(degreeAngle.value, -26.432002, accuracy: 1e-3)
        XCTAssertEqual(degreeAngle.compoundDescription, "-26° 25′ 55″")
    }
}
