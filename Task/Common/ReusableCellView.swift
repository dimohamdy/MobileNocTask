//
//  ReusableCellView.swift
//  Task
//
//  Created by BinaryBoy on 12/8/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation

protocol ReusableCellView: class {
    static var id: String {get}
}

extension ReusableCellView {
    static var id: String {
        return "\(self)"
    }
}
