//
//  AddUserViewController.swift
//  Roomies
//
//  Created by Sam Busane on 11/22/21.
//

import UIKit
import Parse

class AddUserViewController: UIViewController {
   
    var room = PFObject.init(className: "Posts")
    var user = PFUser()
    @IBAction func addUserSubmit(_ sender: UIButton) {
        let username = usernameTextField.text as! String
        var users: [String : PFUser] = [String : PFUser]()
        if room["members"] == nil {
            users[PFUser.current()?["username"] as! String] = PFUser.current()
        } else {
            users = room["members"] as! [String : PFUser]
        }
        //check if user is in the room already
        let query = PFUser.query()
        query?.whereKey("username", equalTo: username)
        query?.findObjectsInBackground(block: { ans, error in
            if ans?.count == 0 {
                print("user not found")
            } else {
                self.user = ans?[0] as! PFUser
                if users[self.user["username"] as! String] != nil {
                    print("user in room already")
                } else {
                    users[self.user["username"] as! String] = self.user
                    self.room["members"] = users
                    self.room.saveInBackground()
                    if self.user["rooms"] == nil {
                        let roomsList = [self.room["name"] as! String: self.room]
                        self.user["rooms"] = self.room
                        let updatedUser = self.user as! PFUser
                        PFCloud.callFunction(inBackground: "addRoomToUser", withParameters:  ["objectId":self.user["objectId"],"newRoom":self.room["objectId"]]) {_,_ in
                            
                        }

                        
                    } else {
                        var roomList = self.user["rooms"] as! [String:PFObject]
                        roomList[self.room["name"] as! String] = self.room
                        let updatedUser = self.user as! PFUser
                        PFCloud.callFunction(inBackground: "addRoomToUser", withParameters:  ["objectId":self.user.objectId,"newRoom":self.room.objectId]) {_,_ in
                            
                        }
                        
                    }
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        })
             
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(room)

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
