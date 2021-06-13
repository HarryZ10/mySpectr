//
//  LoginViewController.swift
//  NewProgram
//
//  Created by CT Oak Student on 4/26/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import Foundation

import UIKit

class LoginViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }


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



