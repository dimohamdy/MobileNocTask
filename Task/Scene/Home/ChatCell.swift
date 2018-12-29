//
//  ChatCell.swift
//  Task
//
//  Created by Ahmed Hamdy on 12/26/18.
//  Copyright © 2018 Ahmed Hamdy. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell,ReusableCellView {

    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var ipLabel: UILabel!
    @IBOutlet weak var subnetLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func config(content:Content) {
        nameLabel.text = content.name
        deviceNameLabel.text = content.model?.name
        ipLabel.text = content.ipAddress
        subnetLabel.text = content.ipSubnetMask
        statusView.backgroundColor = .red

        if let status = content.status?.id,status <= 4 {
            statusView.backgroundColor = State(rawValue: status)?.color
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
enum State:Int {
    case green = 1,orange,yellow,red
    
    var color:UIColor {
        switch self {
        case .green:
            return .green
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .red:
            return .red
        }
    }
}
