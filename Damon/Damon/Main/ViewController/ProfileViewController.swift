//
//  ProfileViewController.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SwiftMessages

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var avatarInt: Int! = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()

        self.navigationItem.title = "Profile"
        
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePictureTableViewCell") as! ProfilePictureTableViewCell
            ControlUtil.setSkyFloatingTextFieldColor(textField: cell.nameTextField)
            cell.nameTextField.title = "Name"
            cell.nameTextField.text = "Min"
            cell.nameTextField.borderStyle = .none
            print("AvatarIcon"+String(avatarInt))
            cell.profileImage.setImage(UIImage(named: ("AvatarIcon"+String(avatarInt))), for: .normal)
            cell.profileImage.addTarget(self, action: #selector(avatarChange), for: UIControl.Event.touchUpInside)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
            if indexPath.row == 0 {
                ControlUtil.setSkyFloatingTextFieldColor(textField: cell.textField, placeholder: "", title: "Sex")
                cell.textField.text = "Male"
            } else if indexPath.row == 1 {
                ControlUtil.setSkyFloatingTextFieldColor(textField: cell.textField, placeholder: "", title: "Age")
                cell.textField.text = "19"
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    @objc func avatarChange(_ sender: Any) {
        let view: AvatarDialogView = try! SwiftMessages.viewFromNib()
        view.configureDropShadow()
        
        view.noAction = {
            SwiftMessages.hide()
        }
        view.yesAction = {
            self.avatarInt = view.avatarNum
            self.tableView.reloadData()
            SwiftMessages.hide()
        }
        
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .forever
        config.presentationStyle = .center
        config.dimMode = .gray(interactive: true)
        view.initControl()
        SwiftMessages.show(config: config, view: view)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 66
        } else {
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    
}
