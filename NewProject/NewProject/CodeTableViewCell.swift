//
//  CodeTableViewCell.swift
//  NewProject
//
//  Created by UjiN on 2/18/20.
//  Copyright © 2020 UjiN. All rights reserved.
//

import UIKit

class CodeTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    
    
    static let id = "CodeTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
