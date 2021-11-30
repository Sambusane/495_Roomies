//
//  RoomTaskViewController.swift
//  Roomies
//
//  Created by Sam Busane on 11/29/21.
//

import UIKit
import iOSDropDown
import Parse

class RoomTaskViewController: UIViewController {
    var roomPass = PFObject.init(className: "Posts")
    
    @IBOutlet weak var taskField: UITextField!
    
    @IBOutlet weak var UsernameField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBAction func onSubmit(_ sender: Any) {
        let users = roomPass["members"] as! [String:Any]
        let username = UsernameField.text as! String
        if users[username] != nil {
            var newTask = PFObject(className: "Tasks")
            
            newTask["name"] = taskField.text
            newTask ["author"] = PFUser.current()!
            newTask ["description"] = descriptionField.text
            newTask ["assignedTo"] = users[username]
            newTask["roomID"] = roomPass
            newTask.saveInBackground {
              (success: Bool, error: Error?) in
              if (success) {
                // The object has been saved.
                self.dismiss(animated: true, completion: nil)
                print("Task saved!")
              } else {
                // There was a problem, check error.description
                print(error?.localizedDescription as Any)
              }
            }
            
            
        }else {
            print("usernot in room")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
