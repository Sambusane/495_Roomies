//
//  RoomsViewController.swift
//  Roomies
//
//  Created by Cooper Steiner on 11/15/21.
//

import UIKit
import Parse

class RoomsViewController: UITableViewController {
    var rooms = [PFObject]()
    var room = PFObject.init(className: "Posts")

    @IBAction func createRoomButton(_ sender: Any) {
        self.performSegue(withIdentifier: "createRoomSegue", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "individualRoomSegue" {
            let detaolsViewController = segue.destination as! IndividualRoomViewController
            detaolsViewController.roomPass = room
        }
       
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        room = rooms[indexPath.row]
        self.performSegue(withIdentifier: "individualRoomSegue", sender: tableView.dequeueReusableCell(withIdentifier: "cell")
                          
)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.current()?["rooms"] != nil {
            let coolRooms = PFUser.current()?["rooms"] as! [String:PFObject]
            let coolerRomms = Array(coolRooms.values)
            var roomInstance = [PFObject]()
            coolerRomms.forEach { indiRoom in
                let query = PFQuery(className: "Posts")
                query.whereKey("objectId",equalTo: indiRoom.objectId)
                query.findObjectsInBackground { tasks, Error in
                    if tasks != nil {
                        roomInstance.append((tasks?[0])!  as PFObject)
                    }
                    self.rooms = roomInstance
                    self.tableView.reloadData()
                }
                
            }
            
        }
        
        

        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rooms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let room = rooms[indexPath.row]
        cell.textLabel?.text = room["name"] as! String

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation



}
