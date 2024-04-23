//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Cristina Andolfatto on 13/04/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var MessageBubble: UIView!
    // outlet on the label
    @IBOutlet weak var Label: UILabel!
    // outlet on the left image avatar
    @IBOutlet weak var leftImageView: UIImageView!
    // outlet on the right image avatar
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // set the corner rounded dependent to the message size
        MessageBubble.layer.cornerRadius = MessageBubble.frame.height / 5
        Label.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
