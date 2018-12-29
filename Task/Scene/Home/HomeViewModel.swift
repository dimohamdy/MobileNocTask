//
//  HomeViewModel.swift
//  Task
//
//  Created by BinaryBoy on 12/26/18.
//  Copyright (c) 2018 Amaal. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeViewModel:BaseViewModel {


    // output
    var contentsObservable: Observable<[Content]> {
        return contents.asObservable()
    }
    // internal
    var serverManager:ServerManager!
    fileprivate var curretPageNumber = 0
    fileprivate var totalPages = 0

//    fileprivate var canLoadMore = true
    let contents: BehaviorRelay<[Content]> = BehaviorRelay<[Content]>(value: [])
    let pageObject: BehaviorRelay<Page?> = BehaviorRelay<Page?>(value: nil)

    
    init(serverManager:ServerManager = ServerManager()) {
        super.init()
        self.serverManager = serverManager
        reloadData()
    }
    func loadMoreData(_ index: IndexPath) {
        if curretPageNumber < totalPages - 1 {
            curretPageNumber += 1
            getPageData()
        }
    }
    func reloadData() {
        curretPageNumber = 0
        loading.accept(false)
        getPageData()
    }
    
    func getPageData() {
        loading.accept(false)
            loading.accept(true)
            serverManager.getMachines(page: curretPageNumber, size: 10) { result in
                self.loading.accept(false)
                switch result {
                case .succeed(let page):
                    guard let page = page,let lastItem = page.last,let content = page.content,let totalPages = page.totalPages else{
                        return
                    }
                    self.pageObject.accept(page)
//                    self.canLoadMore = lastItem
                    self.totalPages = totalPages
                    var arrayOfOldContent = self.contents.value
                     arrayOfOldContent.append(contentsOf: content)
                    let arrayOfNewContent = arrayOfOldContent
                    self.contents.accept(arrayOfNewContent)
                default:
                    break;
                }
            }
    }
    
}
