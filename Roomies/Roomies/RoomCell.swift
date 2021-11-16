//
//  RoomCell.swift
//  Roomies
//
//  Created by Cooper Steiner on 11/15/21.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var roomOwnerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
