//
//  HomeViewController.swift
//  NewProgram
//
//  Created by CT Oak Student on 5/4/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import UIKit
import GoogleSignIn

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
    @IBOutlet var ppIcon: UIButton!

    private var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        
        if (GIDSignIn.sharedInstance().currentUser.profile.hasImage)
        {
            let dimension = round(100 * UIScreen.main.scale)
            guard let pic = GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: UInt(dimension)) else { return }
//            downloadImage(from: pic)
        }
        
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
  
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
//    func downloadImage(from url: URL) {
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            DispatchQueue.main.async() { [weak self] in
//                self?.ppIcon.setImage(UIImage(data: data), for: .normal)
//
//
//        }
//    }
 

    
}
