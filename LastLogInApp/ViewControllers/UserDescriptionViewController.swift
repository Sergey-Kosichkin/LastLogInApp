//
//  UserDescriptionViewController.swift
//  LastLogInApp
//
//  Created by Work on 07.03.2024.
//

import UIKit

class UserDescriptionViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    
    var userData: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = userData.person.description
    }
    

}
