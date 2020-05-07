//
//  Dj.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 5/6/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import Foundation
import UIKit


struct Dj {
   private(set) var firstname : String
    private(set) var userid : String
    private(set) var lastname : String
    private(set) var username : String
    private(set) var email : String
    
    init(firstname : String, userid : String , lastname : String , username :String , email : String) {
        self.firstname = firstname
        self.userid = userid
        self.username = username
        self.lastname = lastname
        self.email = email
    }
    
}

