//
//  SHHotelCell.swift
//  SimpleHotels
//
//  Created by Najmul Hasan on 11/7/17.
//  Copyright © 2017 Expedia, Inc. All rights reserved.
//

import UIKit

class SHHotelCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        thumbnailView.layer.cornerRadius = thumbnailView.frame.size.height/2
        thumbnailView.layer.borderColor = UIColor.lightGray.cgColor
        thumbnailView.layer.borderWidth = 1.0
        thumbnailView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
