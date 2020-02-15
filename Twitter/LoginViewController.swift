//
//  LoginViewController.swift
//  Twitter
//
//  Created by Stephen Baity on 2/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		if UserDefaults.standard.bool(forKey: "loggedIn") == true {
			self.performSegue(withIdentifier: "loginToHome", sender: self)
		}
	}


	@IBAction func onLoginButton(_ sender: Any) {
		print("Logging in")
		let loginUrl = "https://api.twitter.com/oauth/request_token"
		TwitterAPICaller.client?.login(url: loginUrl, success: {
			self.performSegue(withIdentifier: "loginToHome", sender: self)
			UserDefaults.standard.set(true, forKey: "loggedIn")
		}, failure: { (Error) in
			print("Could not log in")
		})
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
