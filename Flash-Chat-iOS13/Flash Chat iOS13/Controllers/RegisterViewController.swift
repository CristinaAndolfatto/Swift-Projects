//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        // if our emailTextField is not nil & our passwordTextField is not nil
        if let email=emailTextfield.text, let password=passwordTextfield.text{
            // create the user with the correspondent email and passrowd
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // if there is an error,print it
                if let e=error {
                    print(e)
                }
                else // if we registered correctly, navigate to ChatViewController
                {
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                }
            }
        }
    }
    
}
