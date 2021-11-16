//
//  ViewController.swift
//  Roomies
//
//  Created by Sam Busane on 10/25/21.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func onLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = self.usernameField.text
        user.password = self.passwordField.text
        
        user.signUpInBackground {(succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                self.displayAlert(withTitle: "Error", message: error.localizedDescription)
            } else {
                self.displayAlert(withTitle: "Success", message: "Account has been successfully created")
            }
        }
    
    }
    func displayAlert(withTitle title: String, message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if title == "Success"{
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alert.dismiss(animated: true)
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }))
        }else{
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
        }
        self.present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

