//
//  SignUpViewController.swift
//  UnBlock
//
//  Created by Danny Franklin on 8/7/17.
//  Copyright © 2017 VDN. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    static let MIN_PASSWORD_LENGTH = 8
    
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!

    @IBAction func signUp(_ sender: UIButton) {
        guard password.text == passwordConfirm.text else {
            let alert = UIAlertController(title: "Password doesn't match", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard password.text!.characters.count >= SignUpViewController.MIN_PASSWORD_LENGTH else {
            let alert = UIAlertController(title: "Password must be at least 8 characters", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let apiManager = UnblockApiManager.sharedInstance
        apiManager.signUp(newUser: Com_Unblock_Proto_NewUserRequest.with {
            $0.username = username.text!
            $0.email = email.text!
            $0.password = password.text!
        }, completion:handleSignUp)
    }
    
    func handleSignUp(_ success: Bool, token: String?) {
        let keychain = KeychainSwift()
        guard success && keychain.set(token!, forKey: LoginViewController.LOGIN_TOKEN) else {
            DispatchQueue.main.async(execute: {
                let alert = UIAlertController(title: "Login failed", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            })
            return
        }
        
        goToLoggedIn()
    }
    
    func goToLoggedIn() {
        DispatchQueue.main.async(execute: {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginSuccessViewController = mainStoryboard.instantiateViewController(withIdentifier:"MainViewController")
            self.present(loginSuccessViewController, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
