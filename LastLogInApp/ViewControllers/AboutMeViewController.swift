//
//  AboutMeViewController.swift
//  LastLogInApp
//
//  Created by Work on 06.03.2024.
//

import UIKit

class AboutMeViewController: UIViewController {

    var userData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userDescriptionVC = segue.destination as? UserDescriptionViewController else {
            return
        }
        userDescriptionVC.userData = userData
    }
    

}
