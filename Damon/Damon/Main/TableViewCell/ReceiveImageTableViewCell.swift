//
//  ReceiveImageTableViewCell.swift
//  P0918
//
//  Created by khhwang on 07/01/2019.
//  Copyright © 2019 SnJ Mobile. All rights reserved.
//

import UIKit

class ReceiveImageTableViewCell: UITableViewCell {

    var profileImageView = UIImageView()
    var nameLabel = UILabel()
    var imageChatView = UIImageView()
    var imageWidth: NSLayoutConstraint!
    var imageHeight: NSLayoutConstraint!
    
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
        contentView.addSubview(imageChatView)
        imageChatView.translatesAutoresizingMaskIntoConstraints = false
        imageChatView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        imageChatView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10.0).isActive = true
        imageChatView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        imageWidth = imageChatView.widthAnchor.constraint(equalToConstant: 100.0)
        imageWidth.isActive = true
        imageHeight = imageChatView.heightAnchor.constraint(equalToConstant: 100.0)
        imageHeight.isActive = true
        imageChatView.layer.cornerRadius = 5.0
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
