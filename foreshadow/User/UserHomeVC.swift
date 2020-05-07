//
//  UserSearchVC.swift
//  foreshadow
//
//  Created by Ebuka Egbunam on 5/1/20.
//  Copyright © 2020 Ebuka Egbunam. All rights reserved.
//

import UIKit

class UserHomeVC: UIViewController {
    let searchBar = UISearchBar()
    var songList = [Song]()
    @IBOutlet weak var songsTable: UITableView!
    var djtable = UITableView()
    let identifier = "cell"
    var originalY : CGFloat = 0
    var djList = [Dj]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        setupSearchBar()
        search(shouldShow: false)
        setupTableView()
        setupDjTable()
       
         djList = FirebaseUser.sharedInstance.searchForDJ(name: "e")
        print(djList)
        // Do any additional setup after loading the view.
    }
    
    
    func setupDjTable(){
        djtable.dataSource = self
        djtable.delegate = self
        setupDjTableView()
        
    }
    
    @objc func removeView(){
        search(shouldShow: false)
        UIView.animate(withDuration: 0.3) { [weak self] in
            if let self = self{
                self.djtable.frame.origin.y = self.originalY
            }
            
        }

        
    }
    
    func animatedjtable(status : Bool){
       
        
        if status{
             songsTable.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(removeView)))
            
            UIView.animate(withDuration: 0.3) { [weak self] in
        
                    if let self = self{
                        self.djtable.frame.origin.y = self.songsTable.frame.origin.y + 40
                    }
                    
                
            }
            
        }else{
            UIView.animate(withDuration: 0.3) { [weak self] in
                if let self = self{
                    self.djtable.frame.origin.y = self.originalY
                }
                
            }
            
        }
        
    }
    
    func setupDjTableView(){
        djtable.frame = CGRect(x: 10, y: self.view.frame.height, width: self.view.frame.width - 20, height: self.view.frame.height/2)
        djtable.layer.cornerRadius = 7
        self.view.addSubview(djtable)
          originalY = djtable.frame.origin.y
        
    }
    
    
    func setupTableView(){
        songsTable.delegate = self
        songsTable.dataSource = self
    }
    
    
    func setupSearchBar(){
        
        searchBar.searchBarStyle = .default
        searchBar.placeholder = " Search for Djs"
        searchBar.sizeToFit()
        searchBar.delegate = self
        
    }
    
    func shouldShowBarButton(show: Bool){
        if show{
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearchBar))
        }else{
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow : Bool){
        shouldShowBarButton(show: !shouldShow)
        animatedjtable(status: shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
        
    }
    @objc func  handleSearchBar(){
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
        
    }
    
    
    
}

extension UserHomeVC :  UISearchBarDelegate{
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
         animatedjtable(status: false)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
    }
    
}

extension UserHomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SearchCell {
            return cell
            
        }else{
            let cell = UITableViewCell()
            cell.backgroundColor = .red
            return UITableViewCell()
        }
    }
    
    
    
    
}
