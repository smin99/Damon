//
//  AvatarDialogView.swift
//  Damon
//
//  Created by HwangSeungmin on 1/27/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit
import SwiftMessages
import DLRadioButton

class AvatarDialogView: MessageView {
    
    var avatarNum: Int! = 1
    
    @IBOutlet var titleLabel2: UILabel!
    @IBOutlet var avatarIcons: [UIButton]!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    
    var noAction: (() -> Void)?
    var yesAction: (() -> Void)?
    
    @IBAction func noButtonAction() {
        noAction?()
    }
    
    @IBAction func yesButtonAction() {
        yesAction?()
    }
    
    func initControl() {
        titleLabel2.text = "Choose Your Avatar".localized
        for iconButton in avatarIcons {
            iconButton.setImage(UIImage(named: ("AvatarIcon"+String(iconButton.tag))), for: .normal)
            iconButton.addTarget(self, action: #selector(avatarSelected), for: UIControl.Event.touchUpInside)
            print("AvatarIcon"+String(iconButton.tag))
        }
        noButton.setTitle("No".localized, for: .normal)
        yesButton.setTitle("Yes".localized, for: .normal)
    }
    
    @objc func avatarSelected (_ sender: UIButton) {
        avatarNum = sender.tag
    }
}
