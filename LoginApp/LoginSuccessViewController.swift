//
//  LoginSuccessViewController.swift
//  UnBlock
//
//  Created by Danny Franklin on 8/2/17.
//  Copyright © 2017 VDN. All rights reserved.
//

import UIKit

class LoginSuccessViewController: UIViewController {
    
    var keychain: KeychainSwift!
    
    @IBOutlet weak var token: UILabel!
    
    @IBAction func logout(_ sender: Any) {
        keychain.delete(LoginViewController.LOGIN_TOKEN)
        DispatchQueue.main.async(execute: {
            let loginStoryboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let loginSuccessViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginSuccessViewController, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        keychain = KeychainSwift()
        let tokenValue = keychain.get(LoginViewController.LOGIN_TOKEN)
        
        token.text = tokenValue
        token.numberOfLines = 0
        token.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
