//
//  HomeViewController.swift
//  Task
//
//  Created by BinaryBoy on 12/26/18.
//  Copyright (c) 2018 Amaal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    fileprivate var viewModel: HomeViewModel = HomeViewModel()
    fileprivate let disposeBag = DisposeBag()

    @IBOutlet var chatTable: UITableView!
    @IBOutlet var servicesTable: UITableView!
    
    init(withViewModel viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
    }
}

// MARK: Setup
private extension HomeViewController {

    func setupRx() {
        self.chatTable.rx.setDelegate(self).disposed(by: self.disposeBag)

        viewModel.contentsObservable.bind(to: chatTable.rx.items) { (tableView, row, content) in

            let indexPath = IndexPath(row: row, section: 0)
            if let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.id, for: indexPath) as? ChatCell {
                // Configure the cell
                cell.config(content: content)
                cell.selectionStyle = .none
                return cell    // 3
            } else {
                return UITableViewCell()
            }

            }.disposed(by: disposeBag)
    }
}
extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewModel.loadMoreData(indexPath)
    }
}
