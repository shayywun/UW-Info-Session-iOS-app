//
//  SessionTableViewCell.swift
//  InfoSession
//
//  Created by Seun Makinde on 2015-12-09.
//  Copyright © 2015 Seun Makinde. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
