import UIKit

class LoginViewController: UIViewController {
    static let LOGIN_TOKEN = "loginToken"
    
    @IBOutlet weak var usernameEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        let apiManager = UnblockApiManager.sharedInstance
        apiManager.login(usernameOrEmail:usernameEmail.text!, password:password.text!, completion:handleLogin)
    }
    
    func handleLogin(_ success: Bool, token: String?) {
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
            let loginSuccessViewController = mainStoryboard.instantiateViewController(withIdentifier:"LoginSuccessViewController")
            self.present(loginSuccessViewController, animated: true, completion: nil)
        })
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

