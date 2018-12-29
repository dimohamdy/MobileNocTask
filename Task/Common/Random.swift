//
//  Random.swift
//  Scout
//
//  Created by BinaryBoy on 12/10/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

extension Int {
    static func randomNumber(range: ClosedRange<Int> = 1...3) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        return Int(arc4random_uniform(UInt32(1 + max - min))) + min
    }
}
