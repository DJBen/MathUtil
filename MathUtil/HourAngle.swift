//
//  HourAngle.swift
//  MathUtil
//
//  Created by Sihao Lu on 12/27/17.
//  Copyright © 2017 Sihao. All rights reserved.
//

public class HourAngle: Angle, CompoundAngle {
    public enum WrapMode {
        case none
        /// Wrap angle within (0h, 24h].
        case range0_24h

        var wrap: (Double) -> Double {
            switch self {
            case .none:
                return { $0 }
            case .range0_24h:
                return { (value) in
                    var wrapped = fmod(value, 24)
                    if wrapped < 0.0 {
                        wrapped += 24
                    }
                    return wrapped
                }
            }
        }
    }

    public override var description: String {
        return "\(wrappedValue)h"
    }

    override class var converter: AngleConverter.Type {
        return HourAngleConverter.self
    }

    var wrapMode: WrapMode = .range0_24h

    public override var wrappedValue: Double {
        return wrapMode.wrap(value)
    }

    public var hour: Double {
        return components[0]
    }

    public var minute: Double {
        return components[1]
    }

    public var second: Double {
        return components[2]
    }

    public convenience init(hour: Double, minute: Double = 0, second: Double = 0) {
        let fractionalHour = hour + minute / 60 + second / 3600
        self.init(fractionalHour)
    }

    // MARK: - Compound angle

    public var compoundDecimalNumberFormatter: NumberFormatter?

    public var sign: Int {
        return value >= 0 ? 1 : -1
    }

    public var components: [Double] {
        let unsignedValue = Double(sign) * wrappedValue
        let (hour, fracMin) = modf(unsignedValue)
        let (minute, secondInMin) = modf(fracMin * 60)
        return [
            hour,
            minute,
            secondInMin * 60
        ]
    }

    public var compoundDescription: String {
        return "\(Int(components[0]))h \(Int(components[1]))m \(compoundDecimalNumberFormatter?.string(from: components[2] as NSNumber)! ?? String(components[2]))s"
    }
}

class HourAngleConverter: AngleConverter {
    override class func valueFromHour(_ hour: Double) -> Double {
        return hour
    }

    override class func valueFromRadian(_ radian: Double) -> Double {
        return radian / Double.pi * 12
    }

    override class func valueFromDegree(_ degree: Double) -> Double {
        return degree / 180 * 12
    }
}
