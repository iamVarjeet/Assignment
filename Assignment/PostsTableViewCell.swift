//
//  PostsTableViewCell.swift
//  Assignment
//
//  Created by ios developer on 28/05/24.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
//MARK: OUTLETS
    @IBOutlet weak var jobTitle_Label: UILabel!
    @IBOutlet weak var jobBody_Label: UILabel!
    @IBOutlet weak var jobID_Label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
