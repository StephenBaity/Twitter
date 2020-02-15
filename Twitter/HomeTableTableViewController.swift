//
//  HomeTableTableViewController.swift
//  Twitter
//
//  Created by Stephen Baity on 2/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class HomeTableTableViewController: UITableViewController {

	var tweetArray = [NSDictionary()]
	var numberOfTweets : Int!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadTweets()

    }
	
	func loadTweets () {
		
		let url = "https://api.twitter.com/1.1/statuses/home_timeline.json"
		let params = ["count": 10]
		TwitterAPICaller.client?.getDictionariesRequest(url: url, parameters: params, success: { (tweets : [NSDictionary]) in
			
			self.tweetArray.removeAll()
			for tweet in tweets {
				self.tweetArray.append(tweet)
			}
			
			self.tableView.reloadData()
			
		}, failure: { (Error) in
			print("Could not retrieve tweet")
		})
	}
	 
	@IBAction func onLogout(_ sender: Any) {
		TwitterAPICaller.client?.logout()
		self.dismiss(animated: true, completion: nil)
		UserDefaults.standard.set(false, forKey: "loggedIn")
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
		
		
		cell.usernameLabel.text = user["name"] as? String
		cell.tweetContentLabel.text = tweetArray[indexPath.row]["text"] as? String
		
		return cell
	}
	
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return tweetArray.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}