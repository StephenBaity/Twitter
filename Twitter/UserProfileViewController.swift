//
//  UserProfileViewController.swift
//  Twitter
//
//  Created by Stephen Baity on 2/21/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {


	
	@IBOutlet weak var username: UILabel!
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var twitterHandle: UILabel!
	@IBOutlet weak var following: UILabel!
	@IBOutlet weak var followers: UILabel!
	@IBOutlet weak var profileDescription: UILabel!
	
	var numberOfFollowers : Int = 0
	var numberOfFollowing : Int = 0
	//var user = [NSDictionary]()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		TwitterAPICaller.client?.getUserProfile(success: { (user: NSDictionary) in
			print(user)
			self.username.text = user["name"] as! String
			self.twitterHandle.text = "@\( user["screen_name"] as! String)"
			
			let imageUrl = URL(string: user["profile_image_url_https"] as! String)
			let data = try? Data(contentsOf: imageUrl!)
			
			if let imageData = data {
				self.profileImage.image = UIImage(data: imageData)
			}
			
			self.profileDescription.text = user["description"] as! String
			
			self.numberOfFollowers = user["followers_count"] as! Int
			print(self.numberOfFollowers)
			self.followers.text = "\(self.numberOfFollowers) Followers"
			
			self.numberOfFollowing = user["friends_count"] as! Int
			self.following.text = "\(self.numberOfFollowing) Following"
			
			
			

			
		}, failure: { (error) in
			print("Unable to get profile")
		})

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
