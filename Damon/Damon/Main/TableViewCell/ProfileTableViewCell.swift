//
//  ProfileTableViewCell.swift
//  Damon
//
//  Created by HwangSeungmin on 1/27/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var textField: SkyFloatingLabelTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
