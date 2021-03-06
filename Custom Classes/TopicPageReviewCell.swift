//
//  TopicPageReviewCell.swift
//  KnowItAll
//
//  Created by Ashish Keshan on 10/15/17.
//  Copyright © 2017 Ashish Keshan. All rights reserved.
//

import UIKit
import Cosmos

class TopicPageReviewCell: UITableViewCell {

    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var upvoteButton: UIButton!
    @IBOutlet weak var downvoteButton: UIButton!
    @IBOutlet weak var optionalImage: UIImageView!
    var reviewUsername = ""
    var reviewTitle = ""
    var upvoteSelected = false
    var downvoteSelected = false
    var ratingVal = 0
    var email = ""
    @IBAction func upvotePressed(_ sender: Any) {
        if email == "" {
            return
            // can create delegate method if we want to show the alert
        }
//        /opinion?username=keshan@usc.edu&type=poll&pollText=Best pizza place?&upvote=1
        if !downvoteSelected && !upvoteSelected {
            let urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=1"
            print("URLSTRING: ", urlString)
            _ = getJSONFromURL(urlString, "POST")
            upvoteSelected = true
            upvoteButton.setImage(UIImage(named: "UpvotePressed"), for: [])
            ratingVal += 1
        }
        else if upvoteSelected {
            let urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=1&deleteFlag=1"
            print("URLSTRING: ", urlString)
            _ = getJSONFromURL(urlString, "POST")
            upvoteSelected = false
            upvoteButton.setImage(UIImage(named: "Upvote"), for: [])
            ratingVal -= 1
        }
        else {
            var urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=0&deleteFlag=1"
            _ = getJSONFromURL(urlString, "POST")
            urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=1"
            _ = getJSONFromURL(urlString, "POST")
            downvoteSelected = false
            downvoteButton.setImage(UIImage(named: "Downvote"), for: [])
            upvoteSelected = true
            upvoteButton.setImage(UIImage(named: "UpvotePressed"), for: [])
            ratingVal += 2
        }
        self.ratingLabel.text = String(ratingVal)
        ratingLabel.setNeedsLayout()
    }
    @IBAction func downvotePressed(_ sender: Any) {
        if email == "" {
            return
            // can create delegate method if we want to show the alert
        }
        if !downvoteSelected && !upvoteSelected {
            let urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=0"
            _ = getJSONFromURL(urlString, "POST")
            downvoteSelected = true
            downvoteButton.setImage(UIImage(named: "DownvotePressed"), for: [])
            ratingVal -= 1
        }
        else if downvoteSelected {
            let urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=0&deleteFlag=1"
            _ = getJSONFromURL(urlString, "POST")
            downvoteSelected = false
            downvoteButton.setImage(UIImage(named: "Downvote"), for: [])
            ratingVal += 1
        }
        else {
            var urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=1&deleteFlag=1"
            _ = getJSONFromURL(urlString, "POST")
            urlString = "/opinion?username=\(email)&type=review&reviewTopic=\(reviewTitle)&reviewUsername=\(reviewUsername)&upvote=0"
            _ = getJSONFromURL(urlString, "POST")
            upvoteSelected = false
            upvoteButton.setImage(UIImage(named: "Upvote"), for: [])
            downvoteSelected = true
            downvoteButton.setImage(UIImage(named: "DownvotePressed"), for: [])
            ratingVal -= 2
        }
        self.ratingLabel.text = String(ratingVal)
        ratingLabel.setNeedsLayout()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        email = UserDefaults.standard.object(forKey: Login.emailKey) as! String
        self.rating.settings.updateOnTouch = false
        self.rating.settings.fillMode = .half
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.ratingLabel.text = String(ratingVal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
