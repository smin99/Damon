//
//  ChattingViewController.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var buddyName: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = buddyName

        tableView.separatorStyle = .none
    }
    
    

}
