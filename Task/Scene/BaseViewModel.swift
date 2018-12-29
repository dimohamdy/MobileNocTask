//
//  BaseViewModel.swift
//  Task
//
//  Created by BinaryBoy on 12/27/18.
//  Copyright © 2018 Amaal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    var loading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    var loadingObservable: Observable<Bool> {
        return loading.asObservable()
    }
}
