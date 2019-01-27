//
//  ReceiveMessageTableViewCell.swift
//  hodu
//
//  Created by khhwang on 2017. 12. 23..
//  Copyright © 2017년 ONTHESKY. All rights reserved.
//

import UIKit

class ReceiveMessageTableViewCell: UITableViewCell {

    var profileImageView = UIImageView()
    var nameLabel = UILabel()
    var messageLabel = EdgeInsetLabel()
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure profileImageView
        contentView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: -10).isActive = true
        profileImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10.0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 50.0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 21.0).isActive = true
        nameLabel.numberOfLines = 1
        nameLabel.font = ThemeColor.recvMessageNameFont
        nameLabel.textColor = ThemeColor.tableViewCellTitleColor
        
        // configure messageLabel
        contentView.addSubview(messageLabel)
        messageLabel.textInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10.0).isActive = true
        messageLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0.0).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.size.width - 50.0).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        messageLabel.numberOfLines = 0
        messageLabel.font = ThemeColor.recvMessageTextFont
        messageLabel.textColor = ThemeColor.recvMessageTextColor
        messageLabel.backgroundColor = ThemeColor.recvMessageBubbleColor
        messageLabel.layer.cornerRadius = 5.0
        messageLabel.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //profileImageView.layer.cornerRadius = 15.0
        //profileImageView.clipsToBounds = true
        //ControlUtil.roundRect(view: profileImageView, size: 5, corners: [.bottomRight, .topRight , .topLeft])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
