//
//  LogInViewController.swift
//  LastLogInApp
//
//  Created by Work on 01.03.2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    private let userData = (user: "User", password: "Password")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userPageVC = segue.destination as? UserPageViewController else {
            return
        }
        userPageVC.userData = userTextField.text
    }
    
    
    @IBAction func logInAction() {
        if checkLoginData() {
            performSegue(withIdentifier: "userScreen", sender: nil)
        } else {
            presentAlert(withTitle: "Error",
                         andMessage: "Wrong user or password",
                         addButton: "OK",
                         withButtonHandler: { _ in self.passwordTextField.text = "" },
                         andSecondButton: nil,
                         withSecondButtonHandler: nil)
        }
    }
    
    @IBAction func forgotUserAction() {
        
        presentAlert(withTitle: "Note!",
                     andMessage: "User name is - \(userData.user)",
                     addButton: "OK",
                     withButtonHandler: { _ in self.userTextField.text = "" },
                     andSecondButton: "Paste",
                     withSecondButtonHandler: { _ in self.userTextField.text = self.userData.user })
    }
    
    @IBAction func forgotPasswordAction() {
        presentAlert(withTitle: "Note!",
                     andMessage: "Password is - \(userData.password)",
                     addButton: "OK",
                     withButtonHandler: { _ in self.passwordTextField.text = "" },
                     andSecondButton: "Paste",
                     withSecondButtonHandler: { _ in self.passwordTextField.text = self.userData.password } )
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
    
    private func checkLoginData() -> Bool {
        if userTextField.text == userData.user,
           passwordTextField.text == userData.password {
            return true
        }
        return false
    }
    
    private func presentAlert(withTitle title: String,
                              andMessage message: String,
                              addButton button: String,
                              withButtonHandler firstHandler: ((UIAlertAction) -> Void)?,
                              andSecondButton secondButton: String?,
                              withSecondButtonHandler secondHandler: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        
        alert.addAction(UIAlertAction(title: button,
                                      style: UIAlertAction.Style.default,
                                      handler: firstHandler))
        
        if let secondButton = secondButton {
            alert.addAction(UIAlertAction(title: secondButton,
                                          style: UIAlertAction.Style.default,
                                          handler: secondHandler))
        }
        
        present(alert, animated: true)
    }
    
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}



extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            logInAction()
        }
        return true
    }
}
