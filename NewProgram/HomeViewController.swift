//
//  HomeViewController.swift
//  NewProgram
//
//  Created by CT Oak Student on 5/4/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}

class HomeViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    @IBOutlet var tempImageView: UIImageView!
    private var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    
    
    @IBAction func didTapButton()
    {
        let picker = UIImagePickerController()
        
        picker.sourceType = .camera
        present(picker, animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)

        tempImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        image = tempImageView.image!
        
        
        performSegue(withIdentifier: "CameraToProfile", sender: self)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
  
 

    
}
