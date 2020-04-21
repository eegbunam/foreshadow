//
//  LoginVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit
import ANActivityIndicator
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
        LogIn()
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
    
    func validateFields() -> String?{
        if email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passowrd.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }else{
            //validate password and email is correct
            return nil
        }
    }
    func LogIn(){
        showIndicator(message: "Signing ...", animationType: .ballClipRotate)
        let error = validateFields()
        if error != nil{
            self.hideIndicator()
            displayAlert(title: "Missing Information", message: "Fill in all the textfields")
            return
        }
        
        let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanpassowrd = passowrd!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        FirebaseUser.sharedInstance.signInUser(email: cleanEmail, password: cleanpassowrd) { [weak self](error) in
            if let error = error {
                self?.hideIndicator()
                self?.displayAlert(title: "Error SigningIn User", message: error.localizedDescription)
                return
                
            }
            // segue to screen
            let vc = UIStoryboard(name: "DJStoryboard", bundle: nil).instantiateViewController(identifier: "DJTabbedViewController") as! DJTabbedViewController
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    
}
