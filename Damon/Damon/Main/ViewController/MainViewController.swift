//
//  ViewController.swift
//  Damon
//
//  Created by HwangSeungmin on 1/26/19.
//  Copyright © 2019 Min. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var studyImage: UIButton!
    @IBOutlet weak var studyLabel: UILabel!
    @IBOutlet weak var fitnessImage: UIButton!
    @IBOutlet weak var fitnessLabel: UILabel!
    
    var profileButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studyLabel.text = "Study Buddy"
        fitnessLabel.text = "Work Out Buddy"
        studyImage.setImage(UIImage(named: "StudyIcon"), for: .normal)
        fitnessImage.setImage(UIImage(named: "FitnessIcon"), for: .normal)
        
        studyImage.addTarget(self, action: #selector(studyPressed), for: UIControl.Event.touchUpInside)
        fitnessImage.addTarget(self, action: #selector(fitnessPressed), for: UIControl.Event.touchUpInside)
        
        profileButton = UIBarButtonItem(image: UIImage(named: "ProfileIcon"), style: .plain, target: self, action: #selector(profilePressed))
        self.navigationItem.rightBarButtonItem = profileButton
    }

    @objc func studyPressed (_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        viewController.studyOrFitness = 0
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func fitnessPressed (_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        viewController.studyOrFitness = 1
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func profilePressed (_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController")
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
}

