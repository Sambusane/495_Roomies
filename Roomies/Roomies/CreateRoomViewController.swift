//
//  CreateRoomViewController.swift
//  Roomies
//
//  Created by Cooper Steiner on 11/15/21.
//

import UIKit
import Parse

class CreateRoomViewController: UIViewController {
    @IBOutlet weak var roomNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreateRoomButton(_ sender: Any) {
        let room = PFObject(className: "Posts")
        
        room["name"] = roomNameField.text!
        room["author"] = PFUser.current()!
        
        room.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            }
            else {
                print("error!")
            }
        }
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
