//
//  ProfileViewController.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
            cell.profileImage.setImage(UIImage(named: "AvatarIcon"), for: .normal) 
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
