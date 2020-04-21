//
//  ViewController.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class verifyUserVC: UIViewController {

    @IBOutlet weak var djOutlet: UIButton!
     @IBOutlet weak var notDjOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = .white
    }
    
    
    @IBAction func dj(_ sender: Any) {
        let vc = UIStoryboard(name: "AuthStoryboard", bundle: nil).instantiateViewController(identifier: "AuthVC") as! AuthVC
               vc.modalPresentationStyle = .fullScreen
               present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func notdj(_ sender: Any) {
        
      
        let vc = UIStoryboard(name: "UserTabbedStoryboard", bundle: nil).instantiateViewController(identifier: "UserTabbedVC") as! UserTabbedVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

extension verifyUserVC{
    func setupView(){
        djOutlet.layer.cornerRadius = 7
        notDjOutlet.layer.cornerRadius = 7
        
    }
    
   
}

