//
//  CreateTaskViewController.swift
//  Roomies
//
//  Created by Sam Busane on 11/15/21.
//

import UIKit
import Parse

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var taskNameField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction func onCreateTask(_ sender: Any) {
        var newTask = PFObject(className: "Tasks")
        
        newTask["name"] = taskNameField.text
        newTask ["author"] = PFUser.current()!
        newTask ["description"] = descriptionTextView.text
        newTask ["assignedTo"] = PFUser.current()!
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
