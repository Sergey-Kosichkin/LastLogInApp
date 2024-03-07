//
//  UserPageViewController.swift
//  LastLogInApp
//
//  Created by Work on 01.03.2024.
//

import UIKit

class UserPageViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    
    
    var userData: User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = "Welcome, \(userData.person.name) \(userData.person.surname)!"
        
    }
    
    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}
