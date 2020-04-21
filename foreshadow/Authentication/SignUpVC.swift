//
//  SignUpVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit
import ANActivityIndicator

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
    
    @IBAction func signUpBtn(_ sender: Any) {
        signUp()
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
    
    
    
       func displayAlert(title: String, message: String) {
           // this function diplays a generec alertviewcontroller with a message
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Restart demo", style: .cancel))
           self.present(alert, animated: true, completion: nil)
           
       }
    
    func validateFields() -> String?{
        if username.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            firstname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastname.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            
        {
            return "Please fill in all fields."
        }else{
            //validate password and email is correct
            return nil
        }
    }
    
    func signUp(){
        showIndicator(message: "Signing Up ...", animationType: .ballClipRotate)
        let error = validateFields()
        if error != nil{
            self.hideIndicator()
            displayAlert(title: "Missing Information", message: "Fill in all the textfields")
            return
        }
        
        let userName = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let firstName = firstname!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastname!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let  passowrd = password!.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let data : [String:String] =
            [ "username" : userName,
              "firstname":firstName,
              "lastname" : lastName,
              "email" : cleanEmail
        ]
        
        FirebaseUser.sharedInstance.createUser(data: data, email: cleanEmail, password: passowrd) { [weak self] (error) in
            if let error = error{
                self?.hideIndicator()
                self?.displayAlert(title: "Error Creating User", message: error.localizedDescription)
                return
            }
            self?.hideIndicator()
            self?.displayAlert(title: "Success Creating User", message: "You are now a DJ on forshadow")
            let vc = UIStoryboard(name: "DJStoryboard", bundle: nil).instantiateViewController(identifier: "DJTabbedViewController") as! DJTabbedViewController
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
            
        }
        
    }
       
       
}
