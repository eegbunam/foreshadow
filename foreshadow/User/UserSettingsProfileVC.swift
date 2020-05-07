//
//  UserProfileVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 4/20/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class UserSettingsProfileVC: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var informationTable: UITableView!
    
    var informationList = ["Terms and Condition","Privacy policy","Feedback"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
        
           profileImage.layer.cornerRadius = 12
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func usertypebtn(_ sender: Any) {
     
        handleUserType()
        
    }
    
    func setupTableView(){
        informationTable.dataSource = self
        informationTable.delegate = self
    }
    
    
    
}

extension UserSettingsProfileVC{
    func handleUserType(){
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "verifyUserVC") as! verifyUserVC
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
        
    }
    
}

extension UserSettingsProfileVC  : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return informationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = informationList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var label : UILabel {
            let header = UILabel()
            header.text = "Privacy"
            header.font = UIFont(descriptor: UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.name: "ArialRoundedMTBold"]), size: 25)
            header.textAlignment = .left
            return header
            
        }
            
            
        
        
       
        
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}
