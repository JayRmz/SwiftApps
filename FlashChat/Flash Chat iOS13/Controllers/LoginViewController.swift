//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Jay Ramirez on 21/10/2021.
//  Copyright © 2021 Jay Ramirez. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    strongSelf.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
       
    }
    
}
