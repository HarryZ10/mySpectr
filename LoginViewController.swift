//
//  LoginViewController.swift
//  NewProgram
//
//  Created by CT Oak Student on 4/26/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn


class LoginViewController: UIViewController {
        
    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.signInHome(notification:)), name: Notification.Name("UserLoggedIn"), object: nil)
    }
    
    @objc func signInHome(notification: Notification)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        print("Hello!!!!!! \(vc)")
        
        self.dismiss(animated: true) {
            print("Dismissed and presented?")
            self.present(vc, animated: true, completion: nil)
            print("Presented")
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//    }
}


@IBDesignable
class FormTextField: UITextField {

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}



