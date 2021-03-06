//
//  TopicReviewCell.swift
//  KnowItAll
//
//  Created by Ashish Keshan on 10/6/17.
//  Copyright © 2017 Ashish Keshan. All rights reserved.
//

import UIKit
import Cosmos

class TopicReviewCell: UITableViewCell {
    
    @IBOutlet weak var numReviews: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starRating.settings.updateOnTouch = false
        starRating.settings.fillMode = .half
        self.selectionStyle = UITableViewCellSelectionStyle.none
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
