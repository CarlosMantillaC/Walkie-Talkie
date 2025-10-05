//
//  ChannelsTableViewCell.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import UIKit

class ChannelsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
