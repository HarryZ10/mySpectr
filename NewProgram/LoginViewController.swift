//
//  LoginViewController.swift
//  NewProgram
//
//  Created by CT Oak Student on 3/3/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let alertService = AlertService()
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapLoginButton() {
        
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
            else { return }
        
        let parameters = ["username": username,
                          "password": password]
        
        networkingService.request(endpoint: "/login", parameters: parameters) { (result) in
            print(result)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainAppVC = segue.destination as? ViewController, let user = sender as? User {
            mainAppVC.user = user
        }
    }
    
    
    
}
