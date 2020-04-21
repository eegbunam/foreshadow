//
//  UserProfileVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func usertypebtn(_ sender: Any) {
        
        handleUserType()
        
    }
    
    
    
}

extension UserProfileVC{
    func handleUserType(){
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "verifyUserVC") as! verifyUserVC
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
        
    }
    
}
