//
//  ProfileVIewController.swift
//  NewProgram
//
//  Created by CT Oak Student on 6/15/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class ProfileViewController: UIViewController
{
//    @IBOutlet var imageView1: UIImageView!
//    private var receivedImage1: UIImage?
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.signOutHome(notification:)), name: Notification.Name("UserLoggedOut"), object: nil)
    }
    
    @objc func signOutHome(notification: Notification)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        print("Hello!!!!!! \(vc)")
        
        self.dismiss(animated: true) {
            print("Dismissed and presented?")
            self.present(vc, animated: true, completion: nil)
            print("Presented")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    
    
    
    
    
}
