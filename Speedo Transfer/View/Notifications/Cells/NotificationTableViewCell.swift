//
//  NotificationTableViewCell.swift
//  Speedo Transfer
//
//  Created by Mohamed on 11/09/2024.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 16
    }

}
