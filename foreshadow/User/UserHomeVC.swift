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
    let id = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Home"
        setupSearchBar()
        search(shouldShow: false)
        setupTableView()
        setupDjTable()
        
        print(djList)
        // Do any additional setup after loading the view.
    }
    
    func animatedjtableHeight(){
        UIView.animate(withDuration: 0.3) {
            self.djtable.frame = CGRect(x: self.djtable.frame.origin.x, y: self.djtable.frame.origin.y, width: self.djtable.frame.size.width, height: self.djtable.contentSize.height)
        }
    }
    
    func setupDjTable(){
        djtable.dataSource = self
        djtable.delegate = self
        djtable.register(UsernameCell.self, forCellReuseIdentifier: id)
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
        djtable.rowHeight = 50
        
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
        FirebaseUser.sharedInstance.searchForDJ(name: searchText.lowercased()
        ) { (djs) in
            guard let djs = djs else {return}
            self.djList = djs
            self.djtable.reloadData()
            DispatchQueue.main.async {
                self.djtable.reloadData()
                if self.djList.count > 3{
                    self.animatedjtableHeight()
                }
                
            }
        }
        
        
    }
    
}

extension UserHomeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == djtable{
            
            if djList.isEmpty{
                return 1
            }else{
                return djList.count
            }
            
        }else if tableView == songsTable{
            return 5
        }
        else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if tableView == djtable{
            if djList.isEmpty{
                return UITableViewCell()
            }else{
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: id ) as? UsernameCell {
                    cell.setupLabels(data: djList[indexPath.row])
                    return cell
                    
                }else{
                    let cell = UITableViewCell()
                    cell.textLabel?.text = djList[indexPath.row].username
                    return cell
                }
                
            }
            
            
        }else if tableView == songsTable{
            if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SearchCell {
                cell.profileImageView.layer.cornerRadius = 7
                cell.postView.layer.cornerRadius = 7
                return cell
                
            }else{
                let cell = UITableViewCell()
                cell.backgroundColor = .red
                return UITableViewCell()
            }
            
        }
        else{
            let cell = UITableViewCell()
            cell.backgroundColor = .red
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if tableView == djtable{
            let view = UIView()
            
            return  view
        }else{
            return UIView()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         if tableView == djtable{
            return 30
         }else{
            return 50
        }
        
    }
    
    
    
}
