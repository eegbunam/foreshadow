//
//  SignUpVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signupbtn: UIButton!
    @IBOutlet weak var userTypeBtn: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func usertypeBtn(_ sender: Any) {
        handleUserType()
       }
       

}

extension SignUpVC {
    func setUpView(){
        Utilities.styleTextField(username)
        Utilities.styleTextField(firstname)
        Utilities.styleTextField(lastname)
        Utilities.styleTextField(email)
        Utilities.styleTextField(password)
        Utilities.styleFilledButton(signupbtn)
        Utilities.styleFilledButton(userTypeBtn)
    }
    
    func handleUserType(){
           let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "verifyUserVC") as! verifyUserVC
           view.window?.rootViewController = vc
           view.window?.makeKeyAndVisible()
           
       }
       
}
