import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func login(_ sender: UIButton) {
        let apiManager = UnblockApiManager.sharedInstance
        apiManager.login(usernameOrEmail:usernameEmail.text!, password:password.text!, completion:handleLogin)
    }
    
    func handleLogin(_ success: Bool, token: String?) {
        DispatchQueue.main.async(execute: {
            let title = success ? "Success" : "Failure"
        let message = success ? "Logged in!: token: " + token! : "Login failed. :-("
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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

