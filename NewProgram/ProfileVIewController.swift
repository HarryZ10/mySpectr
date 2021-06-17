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
    @IBOutlet var profilePicture: UIImageView!
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.signOutHome(notification:)), name: Notification.Name("UserLoggedOut"), object: nil)
        
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        
        if (GIDSignIn.sharedInstance().currentUser.profile.hasImage)
        {
            let dimension = round(100 * UIScreen.main.scale)
            guard let pic = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: UInt(dimension)) else { return }
            downloadImage(from: pic)
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() { [weak self] in
                self?.profilePicture.image = UIImage(data: data)
                self?.profilePicture.layer.cornerRadius = 8.0

                
            }
        }
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
