//
//  ViewController.swift
//  LoginApp
//
//  Created by Anthony Verslues on 6/4/17.
//  Copyright © 2017 VDN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        print(password.text! + " " + usernameEmail.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

