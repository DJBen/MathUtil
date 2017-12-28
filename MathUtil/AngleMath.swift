//
//  AngleMath.swift
//  MathUtil
//
//  Created by Sihao Lu on 12/27/17.
//  Copyright © 2017 Sihao. All rights reserved.
//

public func +<T: Angle>(lhs: T, rhs: T) -> T {
    return T.init(lhs.value + rhs.value)
}

public func -<T: Angle>(lhs: T, rhs: T) -> T {
    return T.init(lhs.value - rhs.value)
}

public func *<T: Angle>(angle: T, constant: Double) -> T {
    return T.init(angle.value * constant)
}

public func /<T: Angle>(angle: T, constant: Double) -> T {
    return T.init(angle.value / constant)
}

public func +=<T: Angle>(lhs: inout T, rhs: T) {
    lhs.value += rhs.value
}

public func -=<T: Angle>(lhs: inout T, rhs: T) {
    lhs.value -= rhs.value
}

public func *=<T: Angle>(lhs: inout T, constant: Double) {
    lhs.value *= constant
}

public func /=<T: Angle>(lhs: inout T, constant: Double) {
    lhs.value /= constant
}
