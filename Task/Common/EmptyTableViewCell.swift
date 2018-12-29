//
//  EmptyTableViewCell.swift
//  Scout
//
//  Created by BinaryBoy on 12/10/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit

extension UITableViewCell {

    static func getEmptyCell(message:String) -> UITableViewCell{
        let cell = UITableViewCell()
        cell.isUserInteractionEnabled = false
        cell.textLabel?.text = message
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        cell.textLabel?.textAlignment = .center
        return cell
    }

}

