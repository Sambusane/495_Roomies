//
//  IndividualRoomCell.swift
//  Roomies
//
//  Created by Cooper Steiner on 11/22/21.
//

import UIKit

class IndividualRoomCell: UITableViewCell {

    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
