//
//  LoginVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passowrd: UITextField!
    
    @IBOutlet weak var loginbtn: UIButton!
    
   
    @IBOutlet weak var userTypeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func userTypeBtn(_ sender: Any) {
        handleUserType()
       }
    
    @IBAction func loginBtn(_ sender: Any) {
        displayAlert(title: "test", message: "testing...")
    }
    

}

extension LoginVC{
    func setUpView(){
        Utilities.styleHollowButton(loginbtn)
        Utilities.styleFilledButton(userTypeBtn)
        Utilities.styleTextField(email)
        Utilities.styleTextField(passowrd)
    }
    
    func handleUserType(){
           let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "verifyUserVC") as! verifyUserVC
           view.window?.rootViewController = vc
           view.window?.makeKeyAndVisible()
           
       }
    func displayAlert(title: String, message: String) {
             // this function diplays a generec alertviewcontroller with a message
             let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Restart demo", style: .cancel))
             self.present(alert, animated: true, completion: nil)
             
         }
       
}
