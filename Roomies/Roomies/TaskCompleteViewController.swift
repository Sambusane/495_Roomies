//
//  TaskCompleteViewController.swift
//  Roomies
//
//  Created by Sam Busane on 12/6/21.
//

import UIKit
import Parse

class TaskCompleteViewController: UIViewController {
    var task = PFObject.init(className: "Tasks")

    @IBOutlet weak var assignedText: UILabel!
    @IBOutlet weak var descText: UILabel!
    @IBOutlet weak var taskName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = task["name"] as! String
        descText.text = task["description"] as! String
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCompleteButton(_ sender: Any) {
        task.deleteInBackground()
        self.dismiss(animated: true, completion: nil)
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
