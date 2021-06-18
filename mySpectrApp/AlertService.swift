//
//  AlertService.swift
//  NewProgram
//
//  Created by CT Oak Student on 3/3/21.
//  Copyright © 2021 CT Oak Student. All rights reserved.
//

import UIKit

class AlertService {
    
    func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
    
    
}
