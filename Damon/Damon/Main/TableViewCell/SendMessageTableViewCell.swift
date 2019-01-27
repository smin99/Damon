//
//  SendMessageTableViewCell.swift
//  hodu
//
//  Created by khhwang on 2017. 12. 23..
//  Copyright © 2017년 ONTHESKY. All rights reserved.
//

import UIKit

class SendMessageTableViewCell: UITableViewCell {

    var messageLabel = EdgeInsetLabel()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure messageLabel
        contentView.addSubview(messageLabel)
        messageLabel.textInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 10).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        messageLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0.0).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.size.width - 50.0).isActive = true
        messageLabel.numberOfLines = 0
        messageLabel.font = ThemeColor.recvMessageTextFont
        messageLabel.textColor = ThemeColor.sendMessageTextColor
        messageLabel.backgroundColor = ThemeColor.sendMessageBubbleColor
        messageLabel.layer.cornerRadius = 5.0
        messageLabel.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
