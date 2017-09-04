//
//  MainViewController.swift
//  UnBlock
//
//  Created by Danny Franklin on 8/9/17.
//  Copyright © 2017 VDN. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var drawableView: UIView!
    @IBOutlet weak var scrollingView: UIView!
    @IBOutlet weak var map: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var keychain: KeychainSwift!
    var token: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        keychain = KeychainSwift()
        token = keychain.get(LoginViewController.LOGIN_TOKEN)
        
        let screenSize: CGRect = UIScreen.main.bounds
        
        map.frame.size.height = screenSize.height
        
        let image: UIImage = UIImage(named: "EastVillageMap")!
        map.frame.size.width = image.size.width/image.size.height*screenSize.height
        map.contentMode = UIViewContentMode.scaleAspectFit
        map.image = image
        
        drawableView.frame.size = map.frame.size
        scrollingView.frame.size = map.frame.size
        scrollView.contentSize = map.frame.size
        scrollView.setContentOffset(CGPoint(x: map.frame.width * 0.18, y: 0), animated: false)

        print(drawableView.frame)
        print(map.frame)
        print(scrollView.frame)
        print(screenSize)
        print(image.size)
        print(scrollView.frame.size)
        print(scrollView.contentSize)
        print(map.frame.size)
    }
    
    @IBAction func logout(_ sender: Any) {
        keychain.delete(LoginViewController.LOGIN_TOKEN)
        DispatchQueue.main.async(execute: {
            let loginStoryboard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
            let loginSuccessViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginSuccessViewController, animated: true, completion: nil)
        })
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return scrollingView
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
