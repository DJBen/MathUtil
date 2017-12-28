//
//  Angle.swift
//  MathUtil
//
//  Created by Sihao Lu on 12/27/17.
//  Copyright © 2017 Sihao. All rights reserved.
//

public class Angle: Equatable, CustomStringConvertible {
    public let value: Double

    public var wrappedValue: Double {
        fatalError("This instance variable should be subclassed")
    }

    class var converter: AngleConverter.Type {
        return AngleConverter.self
    }

    public init(_ value: Double) {
        self.value = value
    }

    public convenience init(degreeAngle: DegreeAngle) {
        let converter = type(of: self).converter
        self.init(converter.valueFromDegree(degreeAngle.value))
    }

    public convenience init(radianAngle: RadianAngle) {
        let converter = type(of: self).converter
        self.init(converter.valueFromRadian(radianAngle.value))
    }

    public convenience init(hourAngle: HourAngle) {
        let converter = type(of: self).converter
        self.init(converter.valueFromHour(hourAngle.value))
    }

    // MARK: - Protocol conformances
    public static func ==(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.value == rhs.value
    }

    public var description: String {
        fatalError("This instance variable should be subclassed")
    }
}

class AngleConverter {
    class func valueFromHour(_ hour: Double) -> Double {
        fatalError("This method should be subclassed")
    }

    class func valueFromRadian(_ radian: Double) -> Double {
        fatalError("This method should be subclassed")
    }

    class func valueFromDegree(_ degree: Double) -> Double {
        fatalError("This method should be subclassed")
    }
}

