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
    
    var users  = Firestore.firestore().collection("users")
    var djlist : [Dj] = []
    
    
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
    
    
    func searchfordjOneLetter (name : String , completion : @escaping (_ dj: [Dj]?)-> ()){
        var djs = [Dj]()
        let query = users.whereField("username", isGreaterThanOrEqualTo: name)
        query.getDocuments { (snapshot, error) in
            
            if error != nil {
                completion(nil)
                return
            }
            
            guard let snapshot = snapshot else {
                completion(nil)
                return
                
            }
            print(snapshot.documents.count)
            for document in snapshot.documents{
                let data = document.data() as [String : Any]
                let username = data["username"] as! String
                let lastname = data["lastname"] as! String
                let email = data["email"] as! String
                let userid = data["userid"] as! String
                let firstname = data["firstname"] as! String
                
                let sinlgeDj = Dj(firstname: firstname, userid: userid, lastname: lastname, username: username, email: email)
                djs.append(sinlgeDj)
                
                
            }
            
            completion(djs)
            
            
        }
        
    }
    
    
    
    func searchForDJ(name : String) -> [Dj]{
        
        if name.count == 1 {
            searchfordjOneLetter(name: name) {  [weak self] (djs)   in
                if let djs = djs {
                    self?.djlist = djs
                }
            }
            
            return djlist
        }else{
            //search for all the name wiht first letter still and update array
            searchfordjOneLetter(name: String(name[name.startIndex])) { [weak self] (djs) in
                if let djs = djs{
                    self?.djlist = djs
                }
            }
            let  finaldjList = djlist.filter { (dj) -> Bool in
                return dj.username.contains(name)
            }
            
            
            return finaldjList
            
        }
        
        
        
        
    }
}
