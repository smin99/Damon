//
//  SendImageTableViewCell.swift
//  P0918
//
//  Created by khhwang on 07/01/2019.
//  Copyright © 2019 SnJ Mobile. All rights reserved.
//

import UIKit

class SendImageTableViewCell: UITableViewCell {

    var imageChatView = UIImageView()
    var imageWidth: NSLayoutConstraint!
    var imageHeight: NSLayoutConstraint!
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure messageLabel
        contentView.addSubview(imageChatView)
        imageChatView.translatesAutoresizingMaskIntoConstraints = false
        imageChatView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        imageChatView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 10).isActive = true
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
