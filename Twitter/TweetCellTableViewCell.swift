//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Stephen Baity on 2/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var tweetContentLabel: UILabel!
	@IBOutlet weak var favButton: UIButton!
	@IBOutlet weak var retweetButton: UIButton!
	
	var favorited : Bool = false
	var retweeted : Bool = false
	var tweetId : Int = -1
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBAction func favoriteTweet(_ sender: Any) {
		let tobeFavorited = !favorited
		
		if(tobeFavorited) {
			TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
				self.setFavorited(isFavorited: true)
			}, failure: { (error) in
				print("Favorite did not succeed")
			})
		} else {
			TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
				self.setFavorited(isFavorited: false)
			}, failure: { (error) in
				print("unfavorite did not succeed")
			})
		}
	}
	
	

	@IBAction func retweet(_ sender: Any) {
		let tobeRetweeted = !retweeted
		
		if(tobeRetweeted) {
			TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
				self.setRetweeted(isRetweeted: true)
			}, failure: { (error) in
				print("Retweet did not succeed")
			})
		} else {TwitterAPICaller.client?.unretweetTweet(tweetId: tweetId, success: {
				self.setRetweeted(isRetweeted: false)
			}, failure: { (error) in
				print("Unretweet did not succeed")
			})
			
		}
		
	}
	

	
	func setFavorited (isFavorited:Bool) {
		favorited = isFavorited
		if (favorited){
			favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
		} else {
			favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal )
		}
	}
	
	func setRetweeted (isRetweeted:Bool) {
		retweeted = isRetweeted
		if (retweeted){
			retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
		} else {
			retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal )
		}
	}

}
