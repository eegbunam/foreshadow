//
//  FirebaseUser.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/21/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import Foundation
import Firebase




class FirebaseUser {
    let database = Firestore.firestore()
    static let sharedInstance = FirebaseUser()
    
    var userIsSigned : Bool = false
    
    func createUser(data : [String:String] , email : String , password : String , completion : @escaping (_ error : Error?)-> ()){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                completion(error)
                return
            }
            guard let result = result else {return}
            var newdata = data
            newdata["userid"] = result.user.uid
            self.database.collection("users").document(result.user.uid).setData(newdata) { (error) in
                if let error = error{
                    completion(error)
                    return
                }else{
                    completion(nil)
                }
            }
            
        }
        
    }
    
    
    func signInUser(email : String , password : String , completion : @escaping (_ error : Error?)-> () ){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                completion(error)
                return
            }else{
                //fetech user data
                completion(nil)
            }
            
        }
        
        
    }
}
