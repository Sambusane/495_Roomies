//
//  TaskViewController.swift
//  Roomies
//
//  Created by Jose Caudillo on 11/15/21.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell") as? listTableViewCell
        cell?.cellLabel.text = array[indexPath.row]
        return cell!
    }
    
    
    
    @IBOutlet weak var listtbl : UITableView!
    
    var array = ["a","b","c","d","e"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listtbl.delegate = self
        self.listtbl.dataSource = self
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

