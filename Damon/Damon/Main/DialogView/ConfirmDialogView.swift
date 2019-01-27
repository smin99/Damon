//
//  AlarmDialogView.swift
//  P1018
//
//  Created by khhwang on 23/10/2018.
//  Copyright © 2018 SnJ Mobile. All rights reserved.
//

import UIKit
import SwiftMessages
import DLRadioButton

// 메모 내용이 변경된 후 뒤로 버튼으로 벗어 나고자 할때 저장할지 묻는 대화상자
class ConfirmDialogView: MessageView {

    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var contentLabel2: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var username: String = ""
    var usersex: Int = 0
    var userage: Int = 0
    
    var noAction: (() -> Void)?
    var yesAction: (() -> Void)?
    var cancelAction: (() -> Void)?
    
    @IBAction func noButtonAction() {
        noAction?()
    }
    
    @IBAction func yesButtonAction() {
        yesAction?()
    }

    
    func initControl() {
        let sexString: String = usersex == 0 ? "Male" : "Female"
        let ageString: String = String(userage)
        titleLabel2.text = "Connect with " + username + "?".localized
        contentLabel2.text = "Name: ".localized + username + "\nSex: ".localized + sexString + "\nAge: ".localized + ageString
        noButton.setTitle("No".localized, for: .normal)
        yesButton.setTitle("Yes".localized, for: .normal)
    }
}
